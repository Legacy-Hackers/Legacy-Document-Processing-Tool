#!/usr/bin/env python3
"""
Complete database reset script that:
1. Drops all tables in the database
2. Recreates them from scratch
3. Cleans up file directories
"""

import os
import sys
import shutil
import logging
from sqlalchemy import inspect, MetaData

# Add the current directory to the path
backend_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, backend_dir)

# Import our modules
from services.database_manager import db_manager, Base
from app.core.config import UPLOAD_FOLDER, EXTRACTED_CONTENT_FOLDER, USE_POSTGRESQL, DATABASE_URI

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

def drop_all_tables():
    """
    Drop all tables in the database, including dynamically created ones.
    """
    try:
        engine = db_manager.engine
        inspector = inspect(engine)
        
        # Drop tables in a specific order to avoid foreign key constraints
        if USE_POSTGRESQL:
            # For PostgreSQL, we need to drop all tables in one transaction
            logger.info("Dropping all tables in PostgreSQL database...")
            
            # First check if the public schema exists
            conn = engine.connect()
            trans = conn.begin()
            
            try:
                # Get all table names
                table_names = inspector.get_table_names()
                
                if table_names:
                    # Drop all tables in the public schema
                    logger.info(f"Found tables: {', '.join(table_names)}")
                    
                    # Create raw SQL to drop all tables
                    drop_query = "DROP TABLE IF EXISTS "
                    drop_query += ", ".join(f'"{table}"' for table in table_names)
                    drop_query += " CASCADE;"
                    
                    conn.execute(drop_query)
                    logger.info("All tables dropped successfully")
                else:
                    logger.info("No tables found to drop")
                
                trans.commit()
            except Exception as e:
                trans.rollback()
                logger.error(f"Error dropping tables: {e}")
                raise
            finally:
                conn.close()
        else:
            # For SQLite, we can use metadata
            logger.info("Dropping all tables in SQLite database...")
            metadata = MetaData()
            metadata.reflect(bind=engine)
            metadata.drop_all(engine)
            logger.info("All tables dropped successfully")
            
        return True
    except Exception as e:
        logger.error(f"Database reset error: {e}")
        return False

def recreate_tables():
    """
    Recreate all tables from SQLAlchemy models
    """
    try:
        # Create all defined tables
        Base.metadata.create_all(db_manager.engine)
        logger.info("All tables recreated successfully")
        return True
    except Exception as e:
        logger.error(f"Error recreating tables: {e}")
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
    """Main function to run the database reset"""
    print("========== COMPLETE DATABASE RESET ==========")
    print("WARNING: This will DELETE ALL TABLES in the database and ALL uploaded documents.")
    print("         This operation CANNOT be undone.")
    print("")
    print(f"Database: {DATABASE_URI}")
    print("")
    
    confirm = input("Type 'RESET' to proceed: ")
    if confirm != "RESET":
        print("Database reset aborted.")
        return
    
    # Drop all tables
    print("\nDropping all tables...")
    if drop_all_tables():
        print("All tables dropped successfully")
    else:
        print("Error dropping tables")
        return
    
    # Recreate tables
    print("\nRecreating tables...")
    if recreate_tables():
        print("Tables recreated successfully")
    else:
        print("Error recreating tables")
        return
    
    # Clean uploads directory
    print(f"\nCleaning uploads directory: {UPLOAD_FOLDER}")
    clean_directory(UPLOAD_FOLDER)
    
    # Clean extracted_content directory
    print(f"\nCleaning extracted content directory: {EXTRACTED_CONTENT_FOLDER}")
    clean_directory(EXTRACTED_CONTENT_FOLDER)
    
    print("\nDatabase reset completed successfully!")

if __name__ == "__main__":
    main() 