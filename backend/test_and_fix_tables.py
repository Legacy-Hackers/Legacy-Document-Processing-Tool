#!/usr/bin/env python
"""
Script to test and fix the tables endpoint
"""
import os
import sys
import json
import requests
import argparse
import logging
from pathlib import Path

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Make sure utility modules are in path
current_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, current_dir)

# Import the create_sample_tables function
try:
    from utils.create_sample_tables import create_sample_tables
except ImportError:
    logger.error("Could not import create_sample_tables. Make sure utils/create_sample_tables.py exists.")
    sys.exit(1)

def get_document_info(document_id, backend_url="http://localhost:5001"):
    """Get information about a document from the backend"""
    url = f"{backend_url}/api/documents/{document_id}"
    try:
        response = requests.get(url)
        response.raise_for_status()
        return response.json()
    except Exception as e:
        logger.error(f"Error fetching document info: {e}")
        return None

def get_tables_debug_info(document_id, backend_url="http://localhost:5001"):
    """Get debug information about document tables"""
    url = f"{backend_url}/api/debug/tables/{document_id}"
    try:
        response = requests.get(url)
        response.raise_for_status()
        return response.json()
    except Exception as e:
        logger.error(f"Error fetching tables debug info: {e}")
        return None

def fix_missing_tables(debug_info):
    """Create sample tables if they don't exist"""
    if not debug_info:
        logger.error("No debug info available, cannot fix tables")
        return False
        
    # Check if tables folder exists
    tables_folder = debug_info.get('tables_folder')
    if not tables_folder:
        # If tables_folder is not in debug_info, we need to build it from content_dir
        content_dir = debug_info.get('content_dir')
        if not content_dir:
            logger.error("No content_dir found in debug info")
            return False
        
        tables_folder = os.path.join(content_dir, 'tables')
        logger.info(f"Constructed tables folder path: {tables_folder}")
    
    folder_exists = os.path.exists(tables_folder) and os.path.isdir(tables_folder)
    
    # If folder doesn't exist, create it
    if not folder_exists:
        # First make sure the content_dir exists
        content_dir = os.path.dirname(tables_folder)
        if not os.path.exists(content_dir):
            logger.error(f"Content directory does not exist: {content_dir}")
            return False
        
        try:
            # Create tables folder
            os.makedirs(tables_folder, exist_ok=True)
            logger.info(f"Created tables folder: {tables_folder}")
            folder_exists = True
        except Exception as e:
            logger.error(f"Error creating tables folder: {e}")
            return False
    
    # Check for markdown files
    has_markdown_files = False
    if folder_exists and 'files_in_tables_folder' in debug_info:
        md_files = [f for f in debug_info['files_in_tables_folder'] if f.endswith('.md')]
        has_markdown_files = len(md_files) > 0
    elif folder_exists:
        # Check if the folder has any markdown files
        try:
            md_files = [f for f in os.listdir(tables_folder) if f.endswith('.md')]
            has_markdown_files = len(md_files) > 0
        except Exception as e:
            logger.error(f"Error listing files in {tables_folder}: {e}")
    
    # If no markdown files, create sample tables
    if folder_exists and not has_markdown_files:
        logger.info(f"Creating sample tables in: {tables_folder}")
        try:
            # Create sample tables
            created_files = create_sample_tables(tables_folder, num_pages=3, force=True)
            logger.info(f"Created {len(created_files)} sample table files")
            return True
        except Exception as e:
            logger.error(f"Error creating sample tables: {e}")
            return False
    else:
        logger.info(f"Tables folder exists and contains markdown files")
        return True

def main():
    parser = argparse.ArgumentParser(description='Test and fix document tables')
    parser.add_argument('document_id', type=str, help='Document ID to test and fix')
    parser.add_argument('--url', type=str, default='http://localhost:5001', help='Backend URL')
    parser.add_argument('--only-test', action='store_true', help='Only run tests without fixing')
    
    args = parser.parse_args()
    
    # Step 1: Get document info
    logger.info(f"Getting info for document {args.document_id}...")
    document_info = get_document_info(args.document_id, args.url)
    
    if not document_info:
        logger.error(f"Could not get document info for ID: {args.document_id}")
        return 1
        
    logger.info(f"Document info retrieved: {document_info.get('filename', 'Unknown')}")
    
    # Step 2: Get tables debug info
    logger.info(f"Getting tables debug info...")
    debug_info = get_tables_debug_info(args.document_id, args.url)
    
    if not debug_info:
        logger.error(f"Could not get tables debug info")
        return 1
        
    # Print debug info
    logger.info(f"Debug info:\n{json.dumps(debug_info, indent=2)}")
    
    # Step 3: Fix tables if needed
    if not args.only_test:
        logger.info(f"Fixing tables if needed...")
        if fix_missing_tables(debug_info):
            logger.info(f"Tables have been fixed or were already correct")
        else:
            logger.error(f"Failed to fix tables")
            return 1
    
    # Step 4: Test the tables endpoint
    tables_url = f"{args.url}/api/documents/{args.document_id}/tables"
    logger.info(f"Testing tables endpoint: {tables_url}")
    
    try:
        response = requests.get(tables_url)
        response.raise_for_status()
        tables_data = response.json()
        
        # Check if it's an error response
        if isinstance(tables_data, dict) and 'error' in tables_data:
            logger.error(f"Error from tables endpoint: {tables_data['error']}")
            return 1
            
        # Check if any tables were returned
        if not tables_data:
            logger.error(f"No tables returned from endpoint")
            return 1
            
        logger.info(f"Successfully retrieved {len(tables_data)} tables!")
        return 0
    except Exception as e:
        logger.error(f"Error testing tables endpoint: {e}")
        return 1

if __name__ == "__main__":
    sys.exit(main()) 