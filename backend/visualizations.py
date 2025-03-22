import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from langchain_google_genai import ChatGoogleGenerativeAI
import os
import json
import ast
from dotenv import load_dotenv
import psycopg2
from typing import Dict, Any, Optional, Tuple
import numpy as np
from typing_extensions import Literal
from pydantic import BaseModel, Field

# Load environment variables
load_dotenv()

# Database configuration using environment variables
DB_CONFIG = {
    "dbname": os.getenv("DB_NAME", "mydb"),
    "user": os.getenv("DB_USER", "postgres"),
    "password": os.getenv("DB_PASSWORD"),
    "host": os.getenv("DB_HOST", "localhost"),
    "port": os.getenv("DB_PORT", "5432")
}

# Schema for routing visualization requests
class VisualizationRoute(BaseModel):
    category: str = Field(
        description="The category of visualization based on the data analysis goal. Must be one of: distribution, comparison, trend, relationship, composition"
    )
    justification: str = Field(
        description="Brief explanation of why this category was chosen"
    )

class DatabaseManager:
    def __init__(self):
        self.config = DB_CONFIG

    def get_available_tables(self) -> list:
        """Get list of available tables from the database"""
        try:
            conn = psycopg2.connect(**self.config)
            cursor = conn.cursor()
            
            # Query to get all tables (excluding system tables)
            query = """
            SELECT tablename 
            FROM pg_catalog.pg_tables
            WHERE schemaname NOT IN ('pg_catalog', 'information_schema', 'pg_toast')
            ORDER BY tablename;
            """
            
            cursor.execute(query)
            tables = [row[0] for row in cursor.fetchall()]
            
            cursor.close()
            conn.close()
            
            return tables
        except Exception as e:
            print(f"Error fetching tables: {str(e)}")
            return []

    def fetch_data(self, query: str) -> Dict[str, Any]:
        """
        Fetch data from PostgreSQL and return as a DataFrame with proper column names
        """
        try:
            # Create a database connection
            conn = psycopg2.connect(**self.config)
            cursor = conn.cursor()
            
            # Execute the query
            cursor.execute(query)
            
            # Get column names from cursor description
            columns = [desc[0] for desc in cursor.description]
            
            # Fetch all rows
            rows = cursor.fetchall()
            
            # Convert rows to list of dictionaries with proper type handling
            data = []
            for row in rows:
                # Convert Decimal to float for each value
                processed_row = []
                for value in row:
                    if isinstance(value, (int, float, str, bool, type(None))):
                        processed_row.append(value)
                    else:
                        # Convert Decimal or other numeric types to float
                        processed_row.append(float(value))
                data.append(dict(zip(columns, processed_row)))
            
            # Create DataFrame
            df = pd.DataFrame(data)
            
            # Print dataset information
            print("\nDataset Information:")
            print("-------------------")
            print(f"Shape: {df.shape}")
            print("\nColumns:")
            for col in df.columns:
                print(f"- {col}: {df[col].dtype}")
            print("\nFirst few rows:")
            print(df.head())
            
            return {
                "data": df,
                "columns": columns,
                "row_count": len(df),
                "column_types": df.dtypes.to_dict()
            }
            
        except Exception as e:
            print(f"Error fetching data: {str(e)}")
            return None
        finally:
            if 'conn' in locals():
                conn.close()

class VisualizationManager(DatabaseManager):
    def __init__(self):
        super().__init__()
        # Initialize Gemini model
        self.llm = ChatGoogleGenerativeAI(model="gemini-2.0-flash")
        # Set default plot styles
        plt.style.use('ggplot')
        sns.set_style("whitegrid")

    def route_visualization(self, query: str, columns: list) -> Dict[str, Any]:
        """Route the visualization request to appropriate plot types based on analysis goal"""
        routing_prompt = f"""
        As a data visualization expert, categorize this visualization request into one of these categories:
        - distribution: For showing how values are distributed (histogram, box, violin plots)
        - comparison: For comparing values across categories (bar, point plots)
        - trend: For showing changes over time or sequence (line, area plots)
        - relationship: For showing correlations or patterns (scatter, reg, heatmap plots)
        - composition: For showing parts of a whole (pie, donut plots)

        User request: {query}
        Available columns: {', '.join(columns)}

        Determine the most appropriate category based on:
        1. The user's explicit or implicit analysis goal
        2. The nature of the columns available
        3. The type of insights the user might be seeking

        Respond with a JSON object containing:
        {{
            "category": "one of: distribution, comparison, trend, relationship, composition",
            "justification": "brief explanation of why this category was chosen"
        }}
        """

        try:
            response = self.llm.invoke(routing_prompt)
            
            # Parse the response as JSON
            try:
                route = json.loads(response.content)
            except:
                # If direct JSON parsing fails, try to extract JSON from the response
                start_idx = response.content.find('{')
                end_idx = response.content.rfind('}') + 1
                if start_idx >= 0 and end_idx > start_idx:
                    json_str = response.content[start_idx:end_idx]
                    route = json.loads(json_str)
                else:
                    raise ValueError("Could not find valid JSON in response")
            
            # Validate the category
            valid_categories = ["distribution", "comparison", "trend", "relationship", "composition"]
            if route["category"] not in valid_categories:
                route["category"] = "comparison"  # Default fallback
            
            # Map categories to recommended plot types
            plot_type_mapping = {
                "distribution": ["histogram", "box", "violin", "kde"],
                "comparison": ["bar", "point", "strip", "swarm"],
                "trend": ["line", "area"],
                "relationship": ["scatter", "reg", "heatmap", "hex", "joint"],
                "composition": ["pie", "donut"]
            }
            
            recommended_plots = plot_type_mapping.get(route["category"], ["bar"])  # Default to bar if category not found
            
            print(f"\nAnalysis Category: {route['category']}")
            print(f"Justification: {route['justification']}")
            print(f"Recommended plot types: {', '.join(recommended_plots)}")
            
            # Use the first recommended plot type as default
            plot_info = self.understand_plot_request(query, columns)
            if plot_info is None:
                # If understanding fails, use the first recommended plot type
                plot_info = {
                    "plot_type": recommended_plots[0],
                    "x_column": columns[0],
                    "y_column": columns[1] if len(columns) > 1 else columns[0]
                }
            
            return plot_info
            
        except Exception as e:
            print(f"Error in routing: {str(e)}")
            return self.understand_plot_request(query, columns)

    def understand_plot_request(self, query: str, columns: list) -> Dict[str, Any]:
        """Use Gemini to understand what kind of plot the user wants"""
        prompt = f"""
        You are a data visualization expert. Your task is to determine the appropriate visualization type and columns from the user's request.

        IMPORTANT: Plot types are NOT columns. Plot types are visualization methods like: scatter, line, bar, pie, histogram, box, violin, heatmap, area, bubble, radar, donut, density, joint, strip, swarm, point, hex, kde, reg.

        User request: {query}
        Available columns: {', '.join(columns)}

        First, identify the plot type from the user's request. Common indicators and their variations:
        - Distribution/Spread/Histogram:
          * "distribution" → histogram
          * "spread" → histogram
          * "frequency" → histogram
          * "histogram" → histogram
          * "how many" → histogram
          * "count of" → histogram

        - Comparison/Bar:
          * "compare" → bar
          * "comparison" → bar
          * "bar chart" → bar
          * "bar" → bar
          * "bars" → bar
          * "versus" → bar
          * "vs" → bar

        - Trend/Line:
          * "trend" → line
          * "over time" → line
          * "line graph" → line
          * "line" → line
          * "progress" → line
          * "growth" → line
          * "change" → line

        - Relationship/Scatter:
          * "relationship" → scatter
          * "correlation" → scatter
          * "scatter plot" → scatter
          * "scatter" → scatter
          * "between" → scatter
          * "against" → scatter

        - Composition/Pie:
          * "composition" → pie
          * "proportion" → pie
          * "percentage" → pie
          * "pie chart" → pie
          * "pie" → pie
          * "breakdown" → pie
          * "distribution of" → pie

        - Box/Boxplot:
          * "box plot" → box
          * "boxplot" → box
          * "box" → box
          * "quartiles" → box
          * "outliers" → box
          * "statistical" → box

        - Heatmap:
          * "heatmap" → heatmap
          * "heat map" → heatmap
          * "correlation matrix" → heatmap
          * "matrix" → heatmap

        - Area:
          * "area chart" → area
          * "area" → area
          * "stacked" → area
          * "cumulative" → area

        - Bubble:
          * "bubble chart" → bubble
          * "bubble" → bubble
          * "size" → bubble
          * "proportional" → bubble

        - Radar/Spider:
          * "radar chart" → radar
          * "radar" → radar
          * "spider" → radar
          * "spider web" → radar

        - Donut:
          * "donut chart" → donut
          * "donut" → donut
          * "ring" → donut
          * "hollow pie" → donut

        - Density:
          * "density plot" → density
          * "density" → density
          * "distribution" → density
          * "smooth" → density

        - Joint:
          * "joint plot" → joint
          * "joint" → joint
          * "combined" → joint
          * "marginal" → joint

        - Strip:
          * "strip plot" → strip
          * "strip" → strip
          * "jitter" → strip
          * "points" → strip

        - Swarm:
          * "swarm plot" → swarm
          * "swarm" → swarm
          * "beeswarm" → swarm
          * "points" → swarm

        - Point:
          * "point plot" → point
          * "point" → point
          * "points" → point
          * "markers" → point

        - Hex:
          * "hex plot" → hex
          * "hex" → hex
          * "hexbin" → hex
          * "density" → hex

        - KDE:
          * "kde plot" → kde
          * "kde" → kde
          * "kernel" → kde
          * "smooth" → kde

        - Regression:
          * "regression" → reg
          * "reg" → reg
          * "trend line" → reg
          * "fit" → reg

        Then, identify which two columns from the available columns should be used for the visualization.

        If the requested visualization is not possible with the available columns, return:
        {{
            "error": true,
            "message": "Explanation of why the visualization is not possible"
        }}

        Otherwise, return:
        {{
            "error": false,
            "plot_type": "one of the plot types listed above",
            "x_column": "one of the available columns",
            "y_column": "one of the available columns"
        }}

        Example responses:
        - For "show me the distribution of sales by category":
          {{"error": false, "plot_type": "histogram", "x_column": "category", "y_column": "sales"}}
        - For "compare prices across different products":
          {{"error": false, "plot_type": "bar", "x_column": "product", "y_column": "price"}}
        - For "show the trend of revenue over time":
          {{"error": false, "plot_type": "line", "x_column": "date", "y_column": "revenue"}}
        - For "analyze the relationship between price and quantity":
          {{"error": false, "plot_type": "scatter", "x_column": "price", "y_column": "quantity"}}
        - For "create a pie chart of sales by non-existent-column":
          {{"error": true, "message": "Cannot create pie chart: column 'non-existent-column' not found in the dataset"}}
        """
        
        try:
            response = self.llm.invoke(prompt)
            print("\nGemini Response:", response.content)  # Debug print
            
            # Try multiple parsing methods
            try:
                # Method 1: Direct ast evaluation
                plot_info = ast.literal_eval(response.content.strip())
            except:
                try:
                    # Method 2: JSON parsing
                    plot_info = json.loads(response.content.strip())
                except:
                    # Method 3: Extract just the JSON part
                    start_idx = response.content.find('{')
                    end_idx = response.content.rfind('}') + 1
                    if start_idx >= 0 and end_idx > start_idx:
                        json_str = response.content[start_idx:end_idx]
                        plot_info = json.loads(json_str)
                    else:
                        raise ValueError("Could not find valid JSON in response")

            # Check if there's an error
            if plot_info.get("error", False):
                print(f"\nError: {plot_info['message']}")
                print("Please try rephrasing your query.")
                return None

            # Validate the response
            required_keys = ["plot_type", "x_column", "y_column"]
            if not all(key in plot_info for key in required_keys):
                raise ValueError("Missing required keys in response")

            # Validate column names
            if plot_info["x_column"] not in columns or plot_info["y_column"] not in columns:
                raise ValueError("Invalid column names in response")

            return plot_info

        except Exception as e:
            print(f"\nError parsing Gemini response: {str(e)}")
            print("Falling back to default plot configuration")
            return {
                "plot_type": "bar",
                "x_column": columns[0],
                "y_column": columns[1] if len(columns) > 1 else columns[0]
            }

    def generate_insights(self, df: pd.DataFrame, plot_info: Dict[str, str], query: str) -> str:
        """Generate insights and rationale for the visualization"""
        try:
            x_col = plot_info["x_column"]
            y_col = plot_info["y_column"]
            plot_type = plot_info["plot_type"]
            
            # Get data types and basic statistics for just the two columns
            x_dtype = str(df[x_col].dtype)
            y_dtype = str(df[y_col].dtype)
            
            # Calculate basic statistics for the two columns
            stats = {}
            if pd.api.types.is_numeric_dtype(df[x_col]):
                stats['x'] = {
                    'mean': float(df[x_col].mean()),
                    'std': float(df[x_col].std()),
                    'min': float(df[x_col].min()),
                    'max': float(df[x_col].max())
                }
            else:
                stats['x'] = {
                    'unique_values': df[x_col].nunique(),
                    'value_counts': {str(k): float(v) for k, v in df[x_col].value_counts().head(3).items()}
                }
                
            if pd.api.types.is_numeric_dtype(df[y_col]):
                stats['y'] = {
                    'mean': float(df[y_col].mean()),
                    'std': float(df[y_col].std()),
                    'min': float(df[y_col].min()),
                    'max': float(df[y_col].max())
                }
            else:
                stats['y'] = {
                    'unique_values': df[y_col].nunique(),
                    'value_counts': {str(k): float(v) for k, v in df[y_col].value_counts().head(3).items()}
                }
            
            # Calculate correlation if both columns are numeric
            if pd.api.types.is_numeric_dtype(df[x_col]) and pd.api.types.is_numeric_dtype(df[y_col]):
                stats['correlation'] = float(df[x_col].corr(df[y_col]))
            
            # Prepare prompt for Gemini
            prompt = f"""
            You are a data visualization expert. Provide detailed rationale but keep other insights concise.

            Visualization Details:
            - Plot Type: {plot_type}
            - X-Axis: {x_col} (Type: {x_dtype})
            - Y-Axis: {y_col} (Type: {y_dtype})

            Column Statistics:
            {x_col}:
            {json.dumps(stats['x'], indent=2)}
            
            {y_col}:
            {json.dumps(stats['y'], indent=2)}
            
            {'Correlation: ' + str(stats['correlation']) if 'correlation' in stats else ''}

            Provide your analysis in this format:

            ### Plot Rationale
            [2-3 sentences explaining why this plot type is suitable, considering:
            1. The nature of the data (types, distribution)
            2. The analysis goal
            3. The insights it will reveal]

            ### Key Pattern
            [One short sentence describing the main pattern or relationship]

            ### Key Finding
            [One short sentence with the most important numerical insight]

            Rules:
            1. Plot Rationale should be 2-3 detailed sentences
            2. Key Pattern and Key Finding must be exactly one line each
            3. Use markdown inline code for numbers (e.g., `123.45`)
            4. Be specific and precise
            5. Focus on the most important insight only
            6. Use active voice
            7. Start with the most important information
            """
            
            response = self.llm.invoke(prompt)
            return response.content.strip()
            
        except Exception as e:
            print(f"Error generating insights: {str(e)}")
            return """### Error Generating Insights
Unable to generate insights at this time. Please check the data types and values in your columns."""

    def create_plot(self, df: pd.DataFrame, plot_info: Dict[str, str], query: str) -> None:
        """Create and save the plot based on user's request"""
        try:
            plot_type = plot_info["plot_type"].lower()
            x_col = plot_info["x_column"]
            y_col = plot_info["y_column"]
            
            print(f"\nCreating {plot_type} plot...")
            
            # Create figure with higher DPI for better quality
            plt.figure(figsize=(12, 8), dpi=300)
            
            # Define a custom color palette for bar graphs
            bar_colors = ['#FF9999', '#66B2FF', '#99FF99', '#FFCC99', '#FF99CC', 
                         '#99CCFF', '#FFB366', '#FF99FF', '#99FFCC', '#FFB3B3']
            
            # Create plot based on type
            if plot_type == "scatter":
                plt.scatter(df[x_col], df[y_col], alpha=0.6)
                
            elif plot_type == "line":
                plt.plot(df[x_col], df[y_col], marker='o')
                
            elif plot_type == "bar":
                # Get unique categories for x-axis
                categories = df[x_col].unique()
                # Create bars with different colors
                bars = plt.bar(range(len(categories)), df.groupby(x_col)[y_col].mean(), 
                             alpha=0.8, color=bar_colors[:len(categories)])
                # Set x-axis ticks and labels
                plt.xticks(range(len(categories)), categories, rotation=45, ha='right')
                
            elif plot_type == "pie":
                plt.pie(df[y_col], labels=df[x_col], autopct='%1.1f%%', startangle=90,
                       colors=bar_colors[:len(df)])
                
            elif plot_type == "histogram":
                plt.hist(df[x_col], bins=30, alpha=0.7, density=True, color=bar_colors[0])
                sns.kdeplot(data=df[x_col], color='red', linewidth=2)
                
            elif plot_type == "box":
                sns.boxplot(data=df, x=x_col, y=y_col, palette=bar_colors[:len(df[x_col].unique())])
                
            elif plot_type == "violin":
                sns.violinplot(data=df, x=x_col, y=y_col, palette=bar_colors[:len(df[x_col].unique())])
                
            elif plot_type == "heatmap":
                pivot_table = pd.pivot_table(df, values=y_col, index=x_col, aggfunc='mean')
                sns.heatmap(pivot_table, annot=True, cmap='YlOrRd')
                
            elif plot_type == "area":
                plt.fill_between(range(len(df)), df[y_col], alpha=0.5, color=bar_colors[0])
                plt.plot(range(len(df)), df[y_col], 'r', alpha=0.8)
                
            elif plot_type == "bubble":
                size = (df[x_col] + df[y_col]) / 2
                plt.scatter(df[x_col], df[y_col], s=size*100, alpha=0.5, color=bar_colors[0])
                
            elif plot_type == "radar":
                angles = np.linspace(0, 2*np.pi, len(df), endpoint=False)
                values = df[y_col].values
                values = np.concatenate((values, [values[0]]))
                angles = np.concatenate((angles, [angles[0]]))
                ax = plt.subplot(111, projection='polar')
                ax.plot(angles, values, color=bar_colors[0])
                ax.fill(angles, values, alpha=0.25, color=bar_colors[0])
                ax.set_xticks(angles[:-1])
                ax.set_xticklabels(df[x_col])
                
            elif plot_type == "donut":
                plt.pie(df[y_col], labels=df[x_col], autopct='%1.1f%%', pctdistance=0.85,
                       colors=bar_colors[:len(df)])
                centre_circle = plt.Circle((0,0), 0.70, fc='white')
                plt.gca().add_artist(centre_circle)
                
            elif plot_type == "density":
                sns.kdeplot(data=df, x=x_col, y=y_col, cmap="viridis", fill=True)
                
            elif plot_type == "joint":
                plt.close()
                g = sns.jointplot(data=df, x=x_col, y=y_col, kind="scatter")
                g.fig.suptitle(query)
                g.fig.set_size_inches(12, 8)
                
            elif plot_type == "strip":
                sns.stripplot(data=df, x=x_col, y=y_col, jitter=True, size=8, 
                            palette=bar_colors[:len(df[x_col].unique())])
                
            elif plot_type == "swarm":
                sns.swarmplot(data=df, x=x_col, y=y_col, 
                            palette=bar_colors[:len(df[x_col].unique())])
                
            elif plot_type == "point":
                sns.pointplot(data=df, x=x_col, y=y_col, 
                            palette=bar_colors[:len(df[x_col].unique())])
                
            elif plot_type == "hex":
                plt.hexbin(df[x_col], df[y_col], gridsize=20, cmap='YlOrRd')
                plt.colorbar(label='count')
                
            elif plot_type == "kde":
                sns.kdeplot(data=df[x_col], fill=True, color=bar_colors[0])
                
            elif plot_type == "reg":
                sns.regplot(data=df, x=x_col, y=y_col, scatter_kws={'alpha':0.5, 'color': bar_colors[0]}, 
                          line_kws={'color': 'red'})
                
            else:
                print(f"Unsupported plot type: {plot_type}")
                return

            # Customize the plot (except for joint plot which is already saved)
            if plot_type != "joint":
                plt.title(query, pad=20)
                if plot_type not in ["pie", "donut", "radar"]:
                    plt.xlabel(x_col)
                    plt.ylabel(y_col)
                
                # Rotate x-axis labels if they're too long
                if plot_type in ["bar", "line", "scatter", "box", "violin", "strip", "swarm", "point"]:
                    plt.xticks(rotation=45, ha='right')
                
                # Adjust layout to prevent label cutoff
                plt.tight_layout()
                
                # Save plot directly as PNG
                output_filename = f"{plot_type}_{x_col}_vs_{y_col}.png"
                plt.savefig(output_filename, bbox_inches='tight', dpi=300)
                plt.close()
                
                print(f"Plot saved as {output_filename}")
                
                # Generate and display insights
                print("\nGenerating insights...")
                insights = self.generate_insights(df, plot_info, query)
                print("\nData Insights:")
                print("-------------")
                print(insights)
            
        except Exception as e:
            print(f"Error creating plot: {str(e)}")
            print("Please check if all required packages are installed:")
            print("pip install matplotlib seaborn pandas numpy python-dotenv psycopg2-binary langchain-google-genai")

def main():
    # Initialize visualization manager
    viz_manager = VisualizationManager()
    
    # Get available tables
    tables = viz_manager.get_available_tables()
    
    if not tables:
        print("No tables found in the database")
    else:
        print("\nAvailable tables:")
        for i, table in enumerate(tables, 1):
            print(f"{i}. {table}")
        
        # Let user select a table
        while True:
            try:
                table_idx = int(input("\nSelect a table number (or 0 to exit): ")) - 1
                if table_idx == -1:
                    exit()
                if 0 <= table_idx < len(tables):
                    break
                print("Invalid table number. Please try again.")
            except ValueError:
                print("Please enter a valid number.")
        
        selected_table = tables[table_idx]
        print(f"\nSelected table: {selected_table}")
        
        # Fetch data from selected table
        sql_query = f"SELECT * FROM {selected_table};"
        result = viz_manager.fetch_data(sql_query)
        
        if result:
            df = result["data"]
            columns = result["columns"]
            
            print("\nComplete Dataset Summary:")
            print("------------------------")
            print(df.info())
            
            # Start visualization loop
            while True:
                try:
                    print("\nWhat would you like to visualize? (type 'exit' to quit)")
                    print("Example queries:")
                    print("- 'Show me the distribution of sales'")
                    print("- 'Compare revenue across different products'")
                    print("- 'How does price trend over time?'")
                    print("- 'What's the relationship between quantity and price?'")
                    print("- 'Show the composition of sales by category'")
                    query = input("> ")
                    
                    if query.lower() in ['exit', 'quit', 'q']:
                        break
                    
                    # Route and create visualization
                    plot_info = viz_manager.route_visualization(query, columns)
                    
                    # Skip if plot_info is None (error occurred)
                    if plot_info is None:
                        continue
                    
                    print(f"\nCreating a {plot_info['plot_type']} plot using:")
                    print(f"X-axis: {plot_info['x_column']}")
                    print(f"Y-axis: {plot_info['y_column']}")
                    
                    # Create and save the plot
                    viz_manager.create_plot(df, plot_info, query)
                    
                except Exception as e:
                    print(f"\nError processing query: {str(e)}")
                    print("Please try another query")

if __name__ == "__main__":
    main()