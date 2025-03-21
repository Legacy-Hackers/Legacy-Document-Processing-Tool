import os
import pandas as pd
import json
from sqlalchemy import create_engine, text, MetaData, Table, Column, Integer, String, Float, DateTime
from sqlalchemy.exc import SQLAlchemyError
from datetime import datetime
import logging

from app.core.config import DATABASE_URL, USE_POSTGRESQL

logger = logging.getLogger(__name__)

class DatabaseManager:
    """Manages database connections and operations"""
    
    def __init__(self):
        """Initialize the database connection"""
        self.engine = create_engine(DATABASE_URL)
        self.metadata = MetaData()
        self.conn = None
        self.tables_info = {}
        
        # Connect to database
        self.connect()
        
        # Initialize required tables
        self.init_tables()
        
    def connect(self):
        """Establish database connection"""
        try:
            self.conn = self.engine.connect()
            logger.info(f"Connected to database: {'PostgreSQL' if USE_POSTGRESQL else 'SQLite'}")
            return True
        except SQLAlchemyError as e:
            logger.error(f"Database connection error: {e}")
            return False
            
    def init_tables(self):
        """Initialize required database tables if they don't exist"""
        try:
            # Documents table to track uploaded files
            documents = Table(
                'documents', self.metadata,
                Column('id', String, primary_key=True),
                Column('filename', String, nullable=False),
                Column('original_path', String, nullable=False),
                Column('extracted_path', String),
                Column('document_type', String),
                Column('upload_date', DateTime, default=datetime.now),
                Column('processing_status', String, default='pending'),
                Column('error_message', String),
            )
            
            # Tables metadata to track extracted tables
            tables_metadata = Table(
                'tables_metadata', self.metadata,
                Column('table_id', String, primary_key=True),
                Column('table_name', String, nullable=False),
                Column('document_id', String, nullable=False),
                Column('page_number', Integer),
                Column('extraction_date', DateTime, default=datetime.now),
                Column('original_table_image', String),
                Column('extracted_markdown', String),
                Column('status', String, default='pending'),
            )
            
            # Create tables in the database
            self.metadata.create_all(self.engine)
            logger.info("Database tables initialized")
            
        except SQLAlchemyError as e:
            logger.error(f"Error initializing database tables: {e}")
            
    def execute_query(self, query, params=None):
        """Execute a SQL query and return the results"""
        try:
            if params:
                result = self.conn.execute(text(query), params)
            else:
                result = self.conn.execute(text(query))
                
            # For SELECT queries, return the results
            if query.strip().upper().startswith('SELECT'):
                columns = result.keys()
                data = result.fetchall()
                return pd.DataFrame(data, columns=columns)
            
            return True
        except SQLAlchemyError as e:
            logger.error(f"Query execution error: {e}")
            return False
            
    def get_tables(self):
        """Get list of all tables in the database"""
        if not USE_POSTGRESQL:
            query = "SELECT name FROM sqlite_master WHERE type='table'"
        else:
            query = "SELECT table_name FROM information_schema.tables WHERE table_schema='public'"
            
        result = self.execute_query(query)
        if isinstance(result, pd.DataFrame) and not result.empty:
            return result.iloc[:, 0].tolist()
        return []
        
    def get_table_schema(self, table_name):
        """Get schema information for a specific table"""
        if not USE_POSTGRESQL:
            query = f"PRAGMA table_info({table_name})"
        else:
            query = f"""
                SELECT column_name, data_type 
                FROM information_schema.columns 
                WHERE table_name = '{table_name}'
            """
            
        return self.execute_query(query)
        
    def store_document(self, doc_id, filename, filepath, doc_type='unknown'):
        """Store information about an uploaded document"""
        query = """
            INSERT INTO documents (id, filename, original_path, document_type, upload_date, processing_status)
            VALUES (:id, :filename, :path, :doc_type, :upload_date, 'pending')
        """
        params = {
            'id': doc_id,
            'filename': filename,
            'path': filepath,
            'doc_type': doc_type,
            'upload_date': datetime.now()
        }
        return self.execute_query(query, params)
        
    def update_document_status(self, doc_id, status, extracted_path=None, error_message=None):
        """Update the processing status of a document"""
        query = """
            UPDATE documents 
            SET processing_status = :status
        """
        params = {'id': doc_id, 'status': status}
        
        if extracted_path:
            query += ", extracted_path = :path"
            params['path'] = extracted_path
            
        if error_message:
            query += ", error_message = :error"
            params['error'] = error_message
            
        query += " WHERE id = :id"
        
        return self.execute_query(query, params)