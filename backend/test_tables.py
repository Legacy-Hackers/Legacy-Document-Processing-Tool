#!/usr/bin/env python
"""
Test script for checking document tables retrieval
"""
import os
import sys
import json
import requests
import argparse

def test_tables_endpoint(document_id, backend_url="http://localhost:5001"):
    """Test the tables endpoint for a specific document ID"""
    # Test the debug endpoint first
    debug_url = f"{backend_url}/api/debug/tables/{document_id}"
    print(f"Testing debug endpoint: {debug_url}")
    
    try:
        debug_response = requests.get(debug_url)
        debug_response.raise_for_status()
        debug_data = debug_response.json()
        
        print("\n===== DEBUG ENDPOINT RESULTS =====")
        print(json.dumps(debug_data, indent=2))
        
        # Check if tables folder exists
        if not debug_data.get('tables_folder_exists', False):
            print(f"\nERROR: Tables folder does not exist at: {debug_data.get('tables_folder')}")
            return False
            
        # Check if there are any markdown files
        if 'files_in_tables_folder' not in debug_data:
            print("\nERROR: No files_in_tables_folder in response")
            return False
            
        md_files = [f for f in debug_data['files_in_tables_folder'] if f.endswith('.md')]
        if not md_files:
            print("\nERROR: No markdown files found in tables folder")
            return False
            
        print(f"\nFound {len(md_files)} markdown files: {', '.join(md_files)}")
        
        # Now test the actual endpoint
        tables_url = f"{backend_url}/api/documents/{document_id}/tables"
        print(f"\nTesting tables endpoint: {tables_url}")
        
        tables_response = requests.get(tables_url)
        tables_response.raise_for_status()
        tables_data = tables_response.json()
        
        # Check for error
        if isinstance(tables_data, dict) and 'error' in tables_data:
            print(f"\nERROR from tables endpoint: {tables_data['error']}")
            return False
            
        # Check if we got any tables
        if not tables_data:
            print("\nERROR: No tables returned from endpoint")
            return False
            
        print(f"\n===== TABLES ENDPOINT RESULTS =====")
        print(f"Retrieved {len(tables_data)} tables")
        
        # Print sample of first table
        if len(tables_data) > 0:
            print("\nSample of first table:")
            first_table = tables_data[0]
            print(f"Page: {first_table.get('page_number')}")
            content = first_table.get('markdown_content', '')
            print(f"Content (first 100 chars): {content[:100]}")
        
        return True
        
    except requests.exceptions.RequestException as e:
        print(f"\nERROR: Failed to connect to endpoint: {e}")
        return False
    except json.JSONDecodeError:
        print(f"\nERROR: Failed to parse JSON response")
        return False
    except Exception as e:
        print(f"\nERROR: Unexpected error: {e}")
        return False

def main():
    parser = argparse.ArgumentParser(description='Test document tables retrieval')
    parser.add_argument('document_id', type=str, help='Document ID to test')
    parser.add_argument('--url', type=str, default='http://localhost:5001', help='Backend URL')
    
    args = parser.parse_args()
    
    result = test_tables_endpoint(args.document_id, args.url)
    
    if result:
        print("\nSUCCESS: Tables retrieval test passed!")
        sys.exit(0)
    else:
        print("\nFAILURE: Tables retrieval test failed!")
        sys.exit(1)

if __name__ == "__main__":
    main() 