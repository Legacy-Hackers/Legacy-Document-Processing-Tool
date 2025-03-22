#!/usr/bin/env python3
"""
Cleanup script to reset the system:
- Clears all database tables (except system tables)
- Deletes all uploaded files
- Deletes all extracted content
"""

import os
import shutil
import psycopg2
from dotenv import load_dotenv
import sys
import logging

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Add the current directory to the path
backend_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, backend_dir)

# Load environment variables
load_dotenv()

def clear_database():
    """Clear all user tables in the database while preserving structure"""
    try:
        # Get database connection parameters from environment
        db_host = os.getenv("DB_HOST", "localhost")
        db_port = os.getenv("DB_PORT", "5432")
        db_name = os.getenv("DB_NAME", "legacy_data")
        db_user = os.getenv("DB_USER", "postgres")
        db_pass = os.getenv("DB_PASS", "")
        
        # Connect to PostgreSQL
        conn = psycopg2.connect(
            host=db_host,
            port=db_port,
            dbname=db_name,
            user=db_user,
            password=db_pass
        )
        
        # Create a cursor with autocommit mode
        conn.autocommit = True
        cursor = conn.cursor()
        
        # Get all tables that start with the timestamp prefix format (typically sth*)
        cursor.execute("""
            SELECT tablename
            FROM pg_tables
            WHERE schemaname = 'public' 
            AND tablename SIMILAR TO '[a-z0-9]{5,7}\_%'
        """)
        
        generated_tables = [row[0] for row in cursor.fetchall()]
        
        # Drop all generated tables
        for table in generated_tables:
            try:
                cursor.execute(f'DROP TABLE IF EXISTS "{table}" CASCADE')
                logger.info(f"Dropped table: {table}")
            except Exception as e:
                logger.error(f"Error dropping table {table}: {e}")
        
        # Clear main application tables but preserve structure
        cursor.execute("DELETE FROM extracted_contents")
        logger.info("Cleared extracted_contents table")
        
        cursor.execute("DELETE FROM documents")
        logger.info("Cleared documents table")
        
        cursor.execute("DELETE FROM tables_metadata")
        logger.info("Cleared tables_metadata table")
        
        # Close the connection
        cursor.close()
        conn.close()
        
        return True
        
    except Exception as e:
        logger.error(f"Database cleanup error: {e}")
        return False

def clean_directory(directory):
    """Delete all files and subdirectories in a directory without removing the directory itself"""
    try:
        if not os.path.exists(directory):
            logger.warning(f"Directory does not exist: {directory}")
            return True
            
        for item in os.listdir(directory):
            item_path = os.path.join(directory, item)
            try:
                if os.path.isfile(item_path):
                    os.unlink(item_path)
                    logger.info(f"Deleted file: {item_path}")
                elif os.path.isdir(item_path):
                    shutil.rmtree(item_path)
                    logger.info(f"Deleted directory: {item_path}")
            except Exception as e:
                logger.error(f"Error deleting {item_path}: {e}")
                
        return True
    except Exception as e:
        logger.error(f"Directory cleanup error: {e}")
        return False

def main():
    """Main function to run the cleanup"""
    print("========== DATABASE AND FILE SYSTEM CLEANUP ==========")
    print("WARNING: This will delete ALL uploaded documents, extracted content,")
    print("         and clear all data from the database.")
    print("")
    
    confirm = input("Type 'CONFIRM' to proceed: ")
    if confirm != "CONFIRM":
        print("Cleanup aborted.")
        return
    
    # Clear database
    print("\nClearing database...")
    clear_database()
    
    # Clean uploads directory
    uploads_dir = os.path.join(backend_dir, "app", "uploads")
    print(f"\nCleaning uploads directory: {uploads_dir}")
    clean_directory(uploads_dir)
    
    # Clean extracted_content directory
    extracted_dir = os.path.join(backend_dir, "app", "extracted_content")
    print(f"\nCleaning extracted content directory: {extracted_dir}")
    clean_directory(extracted_dir)
    
    print("\nCleanup completed successfully!")

if __name__ == "__main__":
    main() 