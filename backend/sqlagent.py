import os
import logging
import json
import pandas as pd
import psycopg2
import time
from typing import Dict, List, Any, Optional, Union

from langchain_google_genai import ChatGoogleGenerativeAI
from langchain_core.messages import HumanMessage, AIMessage, SystemMessage
from langchain.agents.agent_toolkits import SQLDatabaseToolkit
from langchain.sql_database import SQLDatabase
from langchain.agents import create_sql_agent

from dotenv import load_dotenv

load_dotenv()

# Initialize logger
logger = logging.getLogger(__name__)

class SqlAgent:
    """Class to handle SQL querying of PostgreSQL tables with table name awareness"""
    
    def __init__(self, pg_config=None):
        """
        Initialize the SQL agent
        
        Args:
            pg_config: Optional dictionary with PostgreSQL connection parameters
        """
        self.model_name = "gemini-2.0-flash"
        self.temperature = 0.1
        self.llm = None
        self.initialized = False
        # Default maximum number of rows to return
        self.max_rows = 1000  # Increased from hardcoded 20 to 1000 by default
        
        # PostgreSQL connection parameters
        self.pg_config = pg_config or {
            'host': os.environ.get('PG_HOST', 'localhost'),
            'port': os.environ.get('PG_PORT', '5432'),
            'user': os.environ.get('PG_USER', 'postgres'),
            'password': os.environ.get('PG_PASSWORD', ''),
            'dbname': os.environ.get('PG_DATABASE', 'postgres')
        }
    
    def initialize(self):
        """Initialize the SQL agent components"""
        try:
            # Initialize LLM with explicit API key
            api_key = os.getenv('GOOGLE_API_KEY')
            if not api_key:
                raise ValueError("GOOGLE_API_KEY environment variable not set")
                
            self.llm = ChatGoogleGenerativeAI(
                model=self.model_name,
                temperature=self.temperature,
                google_api_key=api_key,
                convert_system_message_to_human=True
            )
            
            self.initialized = True
            logger.info("SQL Agent initialized successfully")
            return True
        
        except Exception as e:
            logger.error(f"Error initializing SQL Agent: {str(e)}")
            self.initialized = False
            return False
    
    def get_connection_string(self, schema_name: str = None) -> str:
        """Get the PostgreSQL connection string"""
        conn_str = f"postgresql://{self.pg_config['user']}:{self.pg_config['password']}@{self.pg_config['host']}:{self.pg_config['port']}/{self.pg_config['dbname']}"
        if schema_name:
            conn_str += f"?options=-c%20search_path%3D{schema_name}"
        return conn_str
    
    def get_table_by_name(self, table_name: str, schema_name: Optional[str] = None) -> Dict[str, Any]:
        """
        Get table information for a specific table name
        
        Args:
            table_name: PostgreSQL table name
            schema_name: Optional schema name, if None will search in all schemas
            
        Returns:
            Dictionary with table information including schema and oid
        """
        try:
            conn = psycopg2.connect(
                host=self.pg_config['host'],
                port=self.pg_config['port'],
                user=self.pg_config['user'],
                password=self.pg_config['password'],
                dbname=self.pg_config['dbname']
            )
            cursor = conn.cursor()
            
            # Query to get table information by name
            if schema_name:
                cursor.execute("""
                    SELECT 
                        n.nspname AS schema_name,
                        c.relname AS table_name,
                        c.oid
                    FROM pg_class c
                    JOIN pg_namespace n ON n.oid = c.relnamespace
                    WHERE c.relname = %s
                    AND n.nspname = %s
                    AND c.relkind = 'r'
                """, (table_name, schema_name))
            else:
                cursor.execute("""
                    SELECT 
                        n.nspname AS schema_name,
                        c.relname AS table_name,
                        c.oid
                    FROM pg_class c
                    JOIN pg_namespace n ON n.oid = c.relnamespace
                    WHERE c.relname = %s
                    AND c.relkind = 'r'
                """, (table_name,))
            
            row = cursor.fetchone()
            conn.close()
            
            if not row:
                return None
            
            return {
                "schema_name": row[0],
                "table_name": row[1],
                "oid": row[2]
            }
        except Exception as e:
            logger.error(f"Error getting table by name: {str(e)}")
            return None
    
    def get_table_names_from_input(self, input_tables: Union[List[str], str]) -> List[Dict[str, str]]:
        """
        Convert various input formats to a list of table names
        
        Args:
            input_tables: Can be a list of table names or a comma-separated string of table names
                          Can include schema qualification (schema.table)
            
        Returns:
            List of dictionaries with schema and table name
        """
        table_list = []
        
        if isinstance(input_tables, list):
            raw_tables = input_tables
        elif isinstance(input_tables, str):
            # Parse comma-separated list of table names
            raw_tables = [t.strip() for t in input_tables.split(',') if t.strip()]
        else:
            return []
        
        # Process each table name, handling schema qualification if present
        for table in raw_tables:
            if '.' in table:
                schema, table_name = table.split('.', 1)
                table_list.append({"schema": schema, "table": table_name})
            else:
                table_list.append({"schema": None, "table": table})
                
        return table_list
    
    def get_oids_from_table_names(self, input_tables: Union[List[str], str]) -> List[int]:
        """
        Get OIDs for the specified table names
        
        Args:
            input_tables: Can be a list of table names or a comma-separated string of table names
                          Can include schema qualification (schema.table)
            
        Returns:
            List of OID integers
        """
        table_list = self.get_table_names_from_input(input_tables)
        oids = []
        
        try:
            conn = psycopg2.connect(
                host=self.pg_config['host'],
                port=self.pg_config['port'],
                user=self.pg_config['user'],
                password=self.pg_config['password'],
                dbname=self.pg_config['dbname']
            )
            cursor = conn.cursor()
            
            for table_info in table_list:
                schema = table_info["schema"]
                table = table_info["table"]
                
                if schema:
                    cursor.execute("""
                        SELECT c.oid
                        FROM pg_class c
                        JOIN pg_namespace n ON n.oid = c.relnamespace
                        WHERE c.relname = %s
                        AND n.nspname = %s
                        AND c.relkind = 'r'
                    """, (table, schema))
                else:
                    cursor.execute("""
                        SELECT c.oid
                        FROM pg_class c
                        JOIN pg_namespace n ON n.oid = c.relnamespace
                        WHERE c.relname = %s
                        AND c.relkind = 'r'
                        AND n.nspname NOT IN ('pg_catalog', 'information_schema')
                    """, (table,))
                
                row = cursor.fetchone()
                if row:
                    oids.append(row[0])
                else:
                    logger.warning(f"No table found for {schema}.{table}" if schema else f"No table found for {table}")
            
            conn.close()
            return oids
        
        except Exception as e:
            logger.error(f"Error getting OIDs from table names: {str(e)}")
            return []
    
    def get_schema_str_by_oids(self, oids: List[int]) -> Dict[str, Any]:
        """
        Get the database schema for specified table OIDs
        
        Args:
            oids: List of PostgreSQL table OIDs
            
        Returns:
            Dictionary with schema information and schema string
        """
        try:
            conn = psycopg2.connect(
                host=self.pg_config['host'],
                port=self.pg_config['port'],
                user=self.pg_config['user'],
                password=self.pg_config['password'],
                dbname=self.pg_config['dbname']
            )
            cursor = conn.cursor()
            
            schema_parts = []
            table_info_map = {}
            schema_names = set()
            
            # Process each OID
            for oid in oids:
                # Get the table information
                cursor.execute("""
                    SELECT 
                        n.nspname AS schema_name,
                        c.relname AS table_name
                    FROM pg_class c
                    JOIN pg_namespace n ON n.oid = c.relnamespace
                    WHERE c.oid = %s
                    AND c.relkind = 'r'
                """, (oid,))
                
                table_info = cursor.fetchone()
                if not table_info:
                    logger.warning(f"No table found for OID {oid}")
                    continue
                
                schema_name = table_info[0]
                table_name = table_info[1]
                schema_names.add(schema_name)
                
                # Get column information
                cursor.execute("""
                    SELECT 
                        a.attname AS column_name,
                        pg_catalog.format_type(a.atttypid, a.atttypmod) AS data_type,
                        CASE WHEN a.attnotnull THEN 'NOT NULL' ELSE 'NULL' END AS is_nullable
                    FROM 
                        pg_catalog.pg_attribute a
                    WHERE 
                        a.attrelid = %s
                        AND a.attnum > 0 
                        AND NOT a.attisdropped
                    ORDER BY a.attnum
                """, (oid,))
                columns = cursor.fetchall()
                
                # Get primary key information
                cursor.execute("""
                    SELECT 
                        a.attname
                    FROM 
                        pg_index i
                        JOIN pg_attribute a ON a.attrelid = i.indrelid AND a.attnum = ANY(i.indkey)
                    WHERE 
                        i.indrelid = %s 
                        AND i.indisprimary
                """, (oid,))
                primary_keys = [pk[0] for pk in cursor.fetchall()]
                
                # Get foreign key information
                cursor.execute("""
                    SELECT
                        kcu.column_name,
                        ccu.table_name AS foreign_table_name,
                        ccu.column_name AS foreign_column_name
                    FROM
                        information_schema.table_constraints AS tc
                        JOIN information_schema.key_column_usage AS kcu
                          ON tc.constraint_name = kcu.constraint_name
                          AND tc.table_schema = kcu.table_schema
                        JOIN information_schema.constraint_column_usage AS ccu
                          ON ccu.constraint_name = tc.constraint_name
                          AND ccu.table_schema = tc.table_schema
                    WHERE tc.constraint_type = 'FOREIGN KEY'
                      AND tc.table_schema = %s
                      AND tc.table_name = %s
                """, (schema_name, table_name))
                foreign_keys = cursor.fetchall()
                
                # Get row count for the table
                cursor.execute(f"""
                    SELECT COUNT(*) FROM "{schema_name}"."{table_name}"
                """)
                row_count = cursor.fetchone()[0]
                
                column_definitions = []
                for col in columns:
                    col_name = col[0]
                    is_pk = col_name in primary_keys
                    col_def = f"  {col_name} {col[1]} {col[2]}"
                    if is_pk:
                        col_def += " PRIMARY KEY"
                    column_definitions.append(col_def)
                
                table_info = f"Table: {schema_name}.{table_name} (OID: {oid}, Rows: {row_count})\nColumns:\n" + "\n".join(column_definitions)
                
                # Add foreign key information if available
                if foreign_keys:
                    fk_definitions = []
                    for fk in foreign_keys:
                        fk_definitions.append(f"  {fk[0]} references {fk[1]}({fk[2]})")
                    table_info += "\nForeign Keys:\n" + "\n".join(fk_definitions)
                
                schema_parts.append(table_info)
                
                # Store table info for return
                table_info_map[oid] = {
                    "schema_name": schema_name,
                    "table_name": table_name,
                    "columns": [col[0] for col in columns],
                    "primary_keys": primary_keys,
                    "foreign_keys": foreign_keys,
                    "row_count": row_count
                }
            
            conn.close()
            
            schema_str = "\n\n".join(schema_parts)
            return {
                "schema_str": schema_str,
                "tables": table_info_map,
                "schemas": list(schema_names)
            }
        except Exception as e:
            logger.error(f"Error getting schema by OIDs: {str(e)}")
            return {"schema_str": "", "tables": {}, "schemas": []}
    
    def query_database_by_table_names(self, table_names: Union[List[str], str], query_text: str, max_rows: int = None) -> Dict[str, Any]:
        """
        Query PostgreSQL database for specific table names
        
        Args:
            table_names: Table names to include in query (can be a list or comma-separated string)
                         Can include schema qualification (schema.table)
            query_text: Natural language query text
            max_rows: Maximum number of rows to return (defaults to self.max_rows)
            
        Returns:
            Dictionary with query results and metadata
        """
        # Set max_rows for this query
        if max_rows is None:
            max_rows = self.max_rows
        
        # Initialize agent if needed
        if not self.initialized:
            self.initialize()
            if not self.initialized:
                return {
                    "status": "error",
                    "message": "Failed to initialize SQL Agent",
                    "answer": "I couldn't process your query because the SQL system is not available."
                }
        
        try:
            # Get OIDs for the provided table names
            oid_list = self.get_oids_from_table_names(table_names)
            if not oid_list:
                return {
                    "status": "error",
                    "message": "No valid tables found with the provided names",
                    "answer": "I couldn't find any tables with the provided names."
                }
            
            # Get schema information for all OIDs
            schema_info = self.get_schema_str_by_oids(oid_list)
            if not schema_info["schema_str"]:
                return {
                    "status": "error",
                    "message": "No schema information found for provided tables",
                    "answer": "I couldn't find any schema information for the provided tables."
                }
            
            # Get a list of all schema names
            schema_names = schema_info["schemas"]
            if not schema_names:
                return {
                    "status": "error",
                    "message": "No schema information found for provided tables",
                    "answer": "I couldn't find any schemas for the provided tables."
                }
            
            # Connect to the database
            # Note: We'll use the first schema for connection, but
            # will instruct the LLM to use fully qualified table names
            db_uri = self.get_connection_string(schema_names[0])
            db = SQLDatabase.from_uri(db_uri)
            
            # Create SQL toolkit and agent
            toolkit = SQLDatabaseToolkit(db=db, llm=self.llm)
            
            # Create the SQL agent with debugging enabled
            agent_executor = create_sql_agent(
                llm=self.llm,
                toolkit=toolkit,
                verbose=True
            )
            
            # Create a list of table names for the query
            table_list = self.get_table_names_from_input(table_names)
            table_names_list = [
                f"{t['schema']}.{t['table']}" if t['schema'] else t['table']
                for t in table_list
            ]
            table_names_str = ", ".join(table_names_list)
            
            # Extract row counts information for the prompt
            row_counts_info = "\n".join([
                f"- {schema_info['tables'][oid]['schema_name']}.{schema_info['tables'][oid]['table_name']}: {schema_info['tables'][oid]['row_count']} rows"
                for oid in oid_list
            ])
            
            # Enhance the query with table information and markdown formatting instructions
            enhanced_query = f"""
            I want to query specific tables in the database. The tables I'm interested in are: {table_names_str}
            
            Here is the schema information for these tables:
            
            {schema_info["schema_str"]}
            
            Table row counts:
            {row_counts_info}
            
            Important instructions:
            1. When generating SQL, always use fully qualified table names with schema (schema_name.table_name).
            2. You can process all rows in the database tables. The tables contain the number of rows shown above.
            3. Use proper join conditions when relationships exist between tables.
            4. If tables are from different schemas, ensure proper schema qualification.
            5. Format your entire response using proper Markdown syntax.
            6. Present data tables in Markdown table format.
            7. Include SQL used in your response in a code block with SQL syntax highlighting.
            8. For large result sets, consider using LIMIT {max_rows} or appropriate aggregation.
            
            My question is: {query_text}
            
            Remember to format your entire answer in clean, well-structured Markdown for the frontend display.
            """
            
            # Execute the query
            start_time = time.time()
            result = agent_executor.invoke({
                "input": enhanced_query,
                "top_k": max_rows  # Use the max_rows parameter instead of hardcoded value
            })
            end_time = time.time()
            
            # Process the result
            answer = result.get("output", "I couldn't find an answer to your query.")
            
            # Try to extract any tables from the result for better formatting
            tables = self.extract_tables_from_answer(answer)
            
            # Ensure the answer is in markdown format
            if not self.is_markdown_formatted(answer):
                answer = self.convert_to_markdown(answer, tables)
            
            return {
                "status": "success",
                "answer": answer,
                "tables": tables,
                "process_time": end_time - start_time,
                "table_info": schema_info["tables"]
            }
            
        except Exception as e:
            logger.error(f"Error querying database by table names: {str(e)}")
            error_message = f"Error querying database: {str(e)}"
            # Return a markdown-formatted error
            answer = f"""
## Error Processing Query

I encountered an error while trying to answer your question about these tables.

```
{error_message}
```

Please try refining your query or check if the tables exist in the database.
"""
            return {
                "status": "error",
                "message": error_message,
                "answer": answer
            }
    
    def is_markdown_formatted(self, text: str) -> bool:
        """Check if text appears to be markdown formatted"""
        markdown_indicators = [
            '##', '**', '```', '|', '- ', '* ', '> ', '[', '](', '_'
        ]
        return any(indicator in text for indicator in markdown_indicators)
    
    def convert_to_markdown(self, text: str, tables: List[Dict[str, Any]]) -> str:
        """Convert plain text to markdown format"""
        # Add a title
        markdown = "## Database Query Results\n\n"
        
        # Add the main content
        paragraphs = [p for p in text.split("\n\n") if p.strip()]
        
        for paragraph in paragraphs:
            # Skip if it's a table we've already processed
            if any("|" in line for line in paragraph.split("\n")):
                continue
                
            # Add the paragraph with proper spacing
            markdown += paragraph + "\n\n"
        
        # Add any tables in markdown format
        if tables:
            markdown += "### Results\n\n"
            for table in tables:
                headers = table.get("headers", [])
                data = table.get("data", [])
                
                if headers and data:
                    # Create header row
                    markdown += "| " + " | ".join(headers) + " |\n"
                    # Create separator row
                    markdown += "| " + " | ".join(["---" for _ in headers]) + " |\n"
                    # Create data rows
                    for row in data:
                        # Ensure row has same number of columns as header
                        while len(row) < len(headers):
                            row.append("")
                        markdown += "| " + " | ".join(row) + " |\n"
                    
                    markdown += "\n"
        
        return markdown
    
    def extract_tables_from_answer(self, answer: str) -> List[Dict[str, Any]]:
        """Extract table data from the answer text if present"""
        tables = []
        
        # Simple heuristic to detect tables in the text
        # This is a basic implementation and could be improved
        sections = answer.split("\n\n")
        
        for section in sections:
            lines = section.strip().split("\n")
            if len(lines) > 2:
                # Check if this looks like a markdown table
                if all("|" in line for line in lines):
                    try:
                        # Try to parse as markdown table
                        header_line = next((line for line in lines if "|" in line), "")
                        header = [h.strip() for h in header_line.split("|") if h.strip()]
                        
                        # Find the data rows (skip header and separator rows)
                        data_lines = []
                        skip_next = False
                        for i, line in enumerate(lines):
                            if "|" in line:
                                if i == 0 or skip_next:  # Skip header
                                    skip_next = False
                                    continue
                                if all("-" in cell for cell in line.split("|") if cell.strip()):  # Skip separator
                                    skip_next = False
                                    continue
                                data_lines.append(line)
                        
                        data = []
                        for line in data_lines:
                            row = [cell.strip() for cell in line.split("|") if cell]
                            if row:
                                data.append(row)
                        
                        if header and data:
                            tables.append({
                                "headers": header,
                                "data": data
                            })
                    except Exception as e:
                        logger.warning(f"Error parsing table from text: {str(e)}")
        
        return tables
    
    # For backward compatibility, maintain the old method but make it use the new functionality
    def query_database_by_oids(self, oids: Union[List[int], int, str], query_text: str, max_rows: int = None) -> Dict[str, Any]:
        """
        Query PostgreSQL database for specific table OIDs (maintained for backward compatibility)
        
        Args:
            oids: Table OIDs to include in query (can be a list, integer, or comma-separated string)
            query_text: Natural language query text
            max_rows: Maximum number of rows to return (defaults to self.max_rows)
            
        Returns:
            Dictionary with query results and metadata
        """
        # Set max_rows for this query
        if max_rows is None:
            max_rows = self.max_rows
            
        # Initialize agent if needed
        if not self.initialized:
            self.initialize()
            if not self.initialized:
                return {
                    "status": "error",
                    "message": "Failed to initialize SQL Agent",
                    "answer": "I couldn't process your query because the SQL system is not available."
                }
        
        try:
            # Parse input OIDs to a list
            oid_list = self.get_oids_from_input(oids)
            if not oid_list:
                return {
                    "status": "error",
                    "message": "No valid table OIDs provided",
                    "answer": "I couldn't process your query because no valid table OIDs were provided."
                }
            
            # Continue with the existing OID-based logic
            schema_info = self.get_schema_str_by_oids(oid_list)
            if not schema_info["schema_str"]:
                return {
                    "status": "error",
                    "message": "No schema information found for provided OIDs",
                    "answer": "I couldn't find any tables with the provided OIDs."
                }
            
            schema_names = schema_info["schemas"]
            if not schema_names:
                return {
                    "status": "error",
                    "message": "No schema information found for provided OIDs",
                    "answer": "I couldn't find any schemas for the provided OIDs."
                }
            
            db_uri = self.get_connection_string(schema_names[0])
            db = SQLDatabase.from_uri(db_uri)
            
            toolkit = SQLDatabaseToolkit(db=db, llm=self.llm)
            
            agent_executor = create_sql_agent(
                llm=self.llm,
                toolkit=toolkit,
                verbose=True
            )
            
            # Extract row counts information for the prompt
            row_counts_info = "\n".join([
                f"- {schema_info['tables'][oid]['schema_name']}.{schema_info['tables'][oid]['table_name']}: {schema_info['tables'][oid]['row_count']} rows"
                for oid in oid_list
            ])
            
            enhanced_query = f"""
            I want to query specific tables in the database identified by their OIDs.
            
            Here is the schema information for these tables:
            
            {schema_info["schema_str"]}
            
            Table row counts:
            {row_counts_info}
            
            Important instructions:
            1. When generating SQL, always use fully qualified table names with schema (schema_name.table_name).
            2. You can process all rows in the database tables. The tables contain the number of rows shown above.
            3. Use proper join conditions when relationships exist between tables.
            4. If tables are from different schemas, ensure proper schema qualification.
            5. Format your entire response using proper Markdown syntax.
            6. Present data tables in Markdown table format.
            7. Include SQL used in your response in a code block with SQL syntax highlighting.
            8. For large result sets, consider using LIMIT {max_rows} or appropriate aggregation.
            
            My question is: {query_text}
            
            Remember to format your entire answer in clean, well-structured Markdown for the frontend display.
            """
            
            start_time = time.time()
            result = agent_executor.invoke({
                "input": enhanced_query,
                "top_k": max_rows
            })
            end_time = time.time()
            
            answer = result.get("output", "I couldn't find an answer to your query.")
            tables = self.extract_tables_from_answer(answer)
            
            # Ensure the answer is in markdown format
            if not self.is_markdown_formatted(answer):
                answer = self.convert_to_markdown(answer, tables)
            
            return {
                "status": "success",
                "answer": answer,
                "tables": tables,
                "process_time": end_time - start_time,
                "table_info": schema_info["tables"]
            }
            
        except Exception as e:
            logger.error(f"Error querying database by OIDs: {str(e)}")
            error_message = f"Error querying database: {str(e)}"
            # Return a markdown-formatted error
            answer = f"""
## Error Processing Query

I encountered an error while trying to answer your question about these tables.

```
{error_message}
```

Please try refining your query or check if the tables exist in the database.
"""
            return {
                "status": "error",
                "message": error_message,
                "answer": answer
            }
    
    def get_oids_from_input(self, input_oids: Union[List[int], int, str]) -> List[int]:
        """
        Convert various input formats to a list of OIDs
        
        Args:
            input_oids: Can be a single OID (int), a list of OIDs, or a comma-separated string of OIDs
            
        Returns:
            List of OID integers
        """
        if isinstance(input_oids, int):
            return [input_oids]
        elif isinstance(input_oids, list):
            return [int(oid) for oid in input_oids if str(oid).isdigit()]
        elif isinstance(input_oids, str):
            # Parse comma-separated list of OIDs
            return [int(oid.strip()) for oid in input_oids.split(',') if oid.strip().isdigit()]
        else:
            return []
sql_agent = SqlAgent()
result = sql_agent.query_database_by_table_names("employee_records", "tell me the insights from the table")