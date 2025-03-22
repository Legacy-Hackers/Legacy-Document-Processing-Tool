#!/usr/bin/env python
"""
Utility to create sample markdown tables for a document
"""
import os
import sys
import argparse
import logging
from pathlib import Path

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Sample markdown tables with different structures
SAMPLE_TABLES = [
    """
# Sample Table 1

| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Row 1, Col 1 | Row 1, Col 2 | Row 1, Col 3 |
| Row 2, Col 1 | Row 2, Col 2 | Row 2, Col 3 |
| Row 3, Col 1 | Row 3, Col 2 | Row 3, Col 3 |
    """,
    
    """
# Sample Table 2

| Name | Age | Occupation |
|------|-----|------------|
| John Doe | 35 | Engineer |
| Jane Smith | 28 | Designer |
| Bob Johnson | 42 | Manager |
    """,
    
    """
# Sample Table 3

| Quarter | Revenue ($) | Growth (%) |
|---------|-------------|------------|
| Q1 2022 | 1,200,000 | 5.2 |
| Q2 2022 | 1,350,000 | 12.5 |
| Q3 2022 | 1,420,000 | 5.1 |
| Q4 2022 | 1,550,000 | 9.2 |
    """
]

def create_sample_tables(folder_path, num_pages=3, force=False):
    """Create sample markdown tables in the specified folder"""
    folder = Path(folder_path)
    
    # Create the folder if it doesn't exist
    if not folder.exists():
        logger.info(f"Creating tables folder: {folder}")
        folder.mkdir(parents=True, exist_ok=True)
    
    # Check if files already exist
    existing_files = list(folder.glob('p*.md'))
    if existing_files and not force:
        logger.info(f"Found {len(existing_files)} existing table files, skipping creation")
        return existing_files
    
    # Create sample tables
    created_files = []
    for page in range(1, num_pages + 1):
        file_path = folder / f"p{page}.md"
        
        # Determine which sample to use
        sample_idx = (page - 1) % len(SAMPLE_TABLES)
        content = SAMPLE_TABLES[sample_idx].strip()
        
        # Add page number to the title
        content = content.replace("Sample Table", f"Sample Table - Page {page}")
        
        # Write content to file
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(content)
            
        logger.info(f"Created table file: {file_path}")
        created_files.append(file_path)
    
    return created_files

def main():
    parser = argparse.ArgumentParser(description='Create sample markdown tables')
    parser.add_argument('folder', type=str, help='Folder to create tables in')
    parser.add_argument('--pages', type=int, default=3, help='Number of pages/tables to create')
    parser.add_argument('--force', action='store_true', help='Overwrite existing files')
    
    args = parser.parse_args()
    
    try:
        files = create_sample_tables(args.folder, args.pages, args.force)
        logger.info(f"Successfully created {len(files)} sample tables")
        return 0
    except Exception as e:
        logger.error(f"Error creating sample tables: {e}")
        return 1

if __name__ == "__main__":
    sys.exit(main()) 