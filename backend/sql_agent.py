import os
import logging
import json
import pandas as pd
import psycopg2
import time
from typing import Dict, List, Any, Optional, Union

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
        self.initialize()
    
    def initialize(self):
        """Initialize the SQL agent components"""
        try:
            # Test database connection
            conn = psycopg2.connect(
                host=self.pg_config['host'],
                port=self.pg_config['port'],
                user=self.pg_config['user'],
                password=self.pg_config['password'],
                dbname=self.pg_config['dbname']
            )
            conn.close()
            
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
                
                # Check if the table name is a prefix pattern (ends with underscore)
                is_prefix_pattern = table.endswith('_')
                
                if schema:
                    if is_prefix_pattern:
                        # Use LIKE for prefix matching
                        cursor.execute("""
                            SELECT c.oid
                            FROM pg_class c
                            JOIN pg_namespace n ON n.oid = c.relnamespace
                            WHERE c.relname LIKE %s
                            AND n.nspname = %s
                            AND c.relkind = 'r'
                        """, (table + '%', schema))
                    else:
                        # Use exact match
                        cursor.execute("""
                            SELECT c.oid
                            FROM pg_class c
                            JOIN pg_namespace n ON n.oid = c.relnamespace
                            WHERE c.relname = %s
                            AND n.nspname = %s
                            AND c.relkind = 'r'
                        """, (table, schema))
                else:
                    if is_prefix_pattern:
                        # Use LIKE for prefix matching without schema
                        cursor.execute("""
                            SELECT c.oid
                            FROM pg_class c
                            JOIN pg_namespace n ON n.oid = c.relnamespace
                            WHERE c.relname LIKE %s
                            AND c.relkind = 'r'
                            AND n.nspname NOT IN ('pg_catalog', 'information_schema')
                        """, (table + '%',))
                    else:
                        # Use exact match without schema
                        cursor.execute("""
                            SELECT c.oid
                            FROM pg_class c
                            JOIN pg_namespace n ON n.oid = c.relnamespace
                            WHERE c.relname = %s
                            AND c.relkind = 'r'
                            AND n.nspname NOT IN ('pg_catalog', 'information_schema')
                        """, (table,))
                
                rows = cursor.fetchall()
                if rows:
                    for row in rows:
                        oids.append(row[0])
                    if is_prefix_pattern:
                        logger.info(f"Found {len(rows)} tables matching prefix pattern {table}%")
                    else:
                        logger.info(f"Found table with exact name: {table}")
                else:
                    if is_prefix_pattern:
                        logger.warning(f"No tables found matching prefix pattern {table}%")
                    else:
                        logger.warning(f"No table found with name: {table}")
            
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
                         Table names ending with underscore (_) are treated as prefix patterns
            query_text: Natural language query text (not used in simplified version)
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
            # Log table names we're searching for
            if isinstance(table_names, list):
                logger.info(f"Searching for tables with names/prefixes: {', '.join(table_names)}")
            else:
                logger.info(f"Searching for tables with names/prefixes: {table_names}")
                
            # Get OIDs for the provided table names
            oid_list = self.get_oids_from_table_names(table_names)
            if not oid_list:
                # Improved error message for prefix patterns
                prefix_patterns = [t for t in (table_names if isinstance(table_names, list) else table_names.split(',')) if t.strip().endswith('_')]
                if prefix_patterns:
                    return {
                        "status": "error",
                        "message": f"No tables found matching the prefix patterns: {', '.join(prefix_patterns)}",
                        "answer": f"I couldn't find any tables matching the specified patterns. Please check if the tables exist in the database."
                    }
                else:
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
            conn = psycopg2.connect(
                host=self.pg_config['host'],
                port=self.pg_config['port'],
                user=self.pg_config['user'],
                password=self.pg_config['password'],
                dbname=self.pg_config['dbname']
            )
            cursor = conn.cursor()
            
            # Get a list of table names with their schemas from the OIDs we found
            tables_data = {}
            for oid in oid_list:
                table_info = schema_info['tables'].get(oid, {})
                if table_info:
                    schema_name = table_info.get('schema_name')
                    table_name = table_info.get('table_name')
                    
                    if schema_name and table_name:
                        qualified_name = f'"{schema_name}"."{table_name}"'
                        
                        # Get sample data from the table
                        try:
                            cursor.execute(f'SELECT * FROM {qualified_name} LIMIT {max_rows}')
                            columns = [desc[0] for desc in cursor.description]
                            rows = cursor.fetchall()
                            
                            tables_data[qualified_name] = {
                                'columns': columns,
                                'sample_data': [list(row) for row in rows],
                                'schema': schema_name,
                                'name': table_name
                            }
                        except Exception as e:
                            logger.error(f"Error getting data from table {qualified_name}: {str(e)}")
            
            conn.close()
            
            # Create a markdown response with the table information
            markdown_response = "## Database Query Results\n\n"
            markdown_response += f"Below is information about the tables you requested.\n\n"
            
            # Add table schema information
            markdown_response += "### Table Schemas\n\n"
            markdown_response += schema_info["schema_str"]
            markdown_response += "\n\n"
            
            # Add sample data for each table
            markdown_response += "### Sample Data\n\n"
            for qualified_name, table_data in tables_data.items():
                markdown_response += f"#### Table: {table_data['schema']}.{table_data['name']}\n\n"
                
                # Create markdown table with sample data
                if table_data['columns'] and table_data['sample_data']:
                    # Header row
                    markdown_response += "| " + " | ".join(table_data['columns']) + " |\n"
                    # Separator row
                    markdown_response += "| " + " | ".join(["---" for _ in table_data['columns']]) + " |\n"
                    
                    # Data rows (limit to 20 for readability)
                    for i, row in enumerate(table_data['sample_data'][:20]):
                        # Convert each cell to string and handle None values
                        row_str = [str(cell) if cell is not None else "" for cell in row]
                        markdown_response += "| " + " | ".join(row_str) + " |\n"
                    
                    # Add indication if there are more rows
                    if len(table_data['sample_data']) > 20:
                        markdown_response += f"\n*Showing 20 of {len(table_data['sample_data'])} rows.*\n"
                    
                    markdown_response += "\n\n"
                else:
                    markdown_response += "*No data available for this table.*\n\n"
            
            # Create tables output in the expected format
            tables_output = []
            for qualified_name, table_data in tables_data.items():
                if table_data['columns'] and table_data['sample_data']:
                    tables_output.append({
                        'headers': table_data['columns'],
                        'data': [list(map(str, row)) for row in table_data['sample_data'][:20]]
                    })
            
            return {
                "status": "success",
                "answer": markdown_response,
                "tables": tables_output,
                "process_time": 0,  # No processing time in this simplified version
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
            
            # Now call the table names method with the schema_info we already have
            schema_info = self.get_schema_str_by_oids(oid_list)
            
            # Create a list of "schema.table" qualified names to pass to the other method
            table_names = []
            for oid in oid_list:
                if oid in schema_info["tables"]:
                    table_info = schema_info["tables"][oid]
                    table_names.append(f"{table_info['schema_name']}.{table_info['table_name']}")
            
            # Call the table names query method with these qualified names
            return self.query_database_by_table_names(table_names, query_text, max_rows)
            
        except Exception as e:
            logger.error(f"Error querying database by OIDs: {str(e)}")
            error_message = f"Error querying database: {str(e)}"
            # Return a markdown-formatted error
            answer = "ERROR"