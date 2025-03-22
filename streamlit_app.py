import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from backend.services.sqlfinal2 import VisualizationManager
import plotly.express as px
import plotly.graph_objects as go
from typing import Dict, Any
import json

# Set page config
st.set_page_config(
    page_title="Data Visualization Explorer",
    page_icon="📊",
    layout="wide",
    initial_sidebar_state="expanded"
)

# Custom CSS
st.markdown("""
    <style>
    .main {
        padding: 2rem;
    }
    .stButton>button {
        width: 100%;
        margin-top: 1rem;
    }
    .dataframe {
        font-size: 0.8rem;
    }
    .plot-container {
        background-color: white;
        padding: 1rem;
        border-radius: 0.5rem;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        margin: 1rem 0;
    }
    </style>
""", unsafe_allow_html=True)

def display_table_info(df: pd.DataFrame):
    """Display detailed information about the selected table"""
    col1, col2, col3 = st.columns(3)
    
    with col1:
        st.metric("Total Rows", len(df))
    with col2:
        st.metric("Total Columns", len(df.columns))
    with col3:
        st.metric("Memory Usage", f"{df.memory_usage(deep=True).sum() / 1024:.2f} KB")
    
    st.subheader("Column Information")
    col_info = pd.DataFrame({
        'Data Type': df.dtypes,
        'Non-null Count': df.count(),
        'Unique Values': df.nunique()
    })
    st.dataframe(col_info, use_container_width=True)
    
    st.subheader("Sample Data")
    st.dataframe(df.head(), use_container_width=True)

def create_plotly_plot(df: pd.DataFrame, plot_info: Dict[str, Any], query: str):
    """Create a plot using Plotly"""
    plot_type = plot_info["plot_type"].lower()
    x_col = plot_info["x_column"]
    y_col = plot_info["y_column"]
    
    if plot_type == "scatter":
        fig = px.scatter(df, x=x_col, y=y_col, title=query)
    elif plot_type == "line":
        fig = px.line(df, x=x_col, y=y_col, title=query)
    elif plot_type == "bar":
        fig = px.bar(df, x=x_col, y=y_col, title=query)
    elif plot_type == "pie":
        fig = px.pie(df, values=y_col, names=x_col, title=query)
    elif plot_type == "histogram":
        fig = px.histogram(df, x=x_col, title=query)
    elif plot_type == "box":
        fig = px.box(df, x=x_col, y=y_col, title=query)
    elif plot_type == "violin":
        fig = px.violin(df, x=x_col, y=y_col, title=query)
    elif plot_type == "heatmap":
        pivot_table = pd.pivot_table(df, values=y_col, index=x_col, aggfunc='mean')
        fig = px.imshow(pivot_table, title=query)
    else:
        st.error(f"Unsupported plot type: {plot_type}")
        return
    
    # Update layout for better appearance
    fig.update_layout(
        template="plotly_white",
        height=600,
        margin=dict(l=50, r=50, t=50, b=50),
        showlegend=True,
        legend=dict(
            orientation="h",
            yanchor="bottom",
            y=1.02,
            xanchor="right",
            x=1
        )
    )
    
    return fig

def main():
    st.title("📊 Data Visualization Explorer")
    st.markdown("""
        This app helps you explore and visualize your database tables using natural language queries.
        Select a table and ask questions about your data!
    """)
    
    # Initialize visualization manager
    viz_manager = VisualizationManager()
    
    # Get available tables
    tables = viz_manager.get_available_tables()
    
    if not tables:
        st.error("No tables found in the database")
        return
    
    # Table selection
    selected_table = st.selectbox(
        "Select a table to analyze",
        tables,
        index=0
    )
    
    if selected_table:
        st.subheader(f"📋 Table: {selected_table}")
        
        # Fetch data from selected table
        sql_query = f"SELECT * FROM {selected_table};"
        result = viz_manager.fetch_data(sql_query)
        
        if result:
            df = result["data"]
            columns = result["columns"]
            
            # Display table information
            display_table_info(df)
            
            # Visualization section
            st.subheader("🎨 Create Visualization")
            
            # Query input with examples
            st.markdown("""
                **Example queries:**
                - "Show me the distribution of sales"
                - "Compare revenue across different products"
                  
                - "What's the relationship between quantity and price?"
                - "Show the composition of sales by category"
            """)
            
            query = st.text_input("Enter your visualization query:", "")
            
            if query:
                with st.spinner("Processing your query..."):
                    # Route and create visualization
                    plot_info = viz_manager.route_visualization(query, columns)
                    
                    if plot_info:
                        # Create and display plot
                        fig = create_plotly_plot(df, plot_info, query)
                        if fig:
                            st.plotly_chart(fig, use_container_width=True)
                            
                            # Display insights
                            st.subheader("📈 Insights")
                            insights = viz_manager.generate_insights(df, plot_info, query)
                            st.markdown(insights)
                    else:
                        st.error("Could not understand the visualization request. Please try rephrasing your query.")

if __name__ == "__main__":
    main() 