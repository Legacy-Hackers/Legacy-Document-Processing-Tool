from flask import Flask, jsonify, request, send_file, send_from_directory
from flask_cors import CORS
import os
import logging
import sys
import uuid
import datetime
import time
import shutil

# Add the current directory to the path
backend_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, backend_dir)

# Import configurations and services
from app.core.config import SECRET_KEY, UPLOAD_FOLDER, EXTRACTED_CONTENT_FOLDER, DEBUG
from services.database_manager import db_manager, init_db
from sql_agent import SqlAgent
# from app.retriever import RAGSystem
from app.Content_Extractors.PdfContentExtractor import PdfContentExtractor

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Initialize Flask app
app = Flask(__name__)
app.config['SECRET_KEY'] = SECRET_KEY
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['MAX_CONTENT_LENGTH'] = 30 * 1024 * 1024  # 30MB max upload size

# Enable CORS for all routes
CORS(app, resources={r"/api/*": {"origins": ["http://localhost:3000", "http://127.0.0.1:3000", "http://localhost:3001", "http://127.0.0.1:3001"]}})

# Initialize RAG system and SQL agent
rag_system = None
sql_agent = None

# Initialize database
@app.before_first_request
def before_first_request():
    """Initialize the database and required services before the first request"""
    global rag_system, sql_agent
    
    # Initialize database
    init_db()
    logger.info("Database initialized")
    
    # # Initialize RAG system
    # rag_system = RAGSystem(
    #     workspace_dir=os.path.dirname(os.path.abspath(__file__)),
    #     verbose=True
    # )
    
    # # Setup RAG system and log whether it was successful
    # setup_success = rag_system.setup()
    # if not setup_success:
    #     logger.warning("RAG system setup was incomplete. Chat functionality may be limited.")
    
    # Initialize SQL agent
    sql_agent = SqlAgent()
    sql_agent.initialize()


# Routes
@app.route('/api/health', methods=['GET'])
def health_check():
    """Health check endpoint"""
    return jsonify({"status": "healthy"})


@app.route('/api/documents', methods=['GET'])
def get_all_documents():
    """Get all documents from the database."""
    try:
        # Get all documents from the database
        db_manager = get_db_manager()
        documents = db_manager.get_all_documents()
        
        # Format documents for API response
        formatted_docs = []
        for doc in documents:
            # Calculate file size if file exists
            file_size = ""
            if os.path.exists(doc.file_path):
                size_bytes = os.path.getsize(doc.file_path)
                # Convert to appropriate units
                if size_bytes < 1024:
                    file_size = f"{size_bytes} B"
                elif size_bytes < 1024 * 1024:
                    file_size = f"{size_bytes/1024:.1f} KB"
                else:
                    file_size = f"{size_bytes/(1024*1024):.1f} MB"
            
            formatted_docs.append({
                'id': doc.id,
                'filename': doc.filename,
                'file_path': doc.file_path,
                'upload_date': doc.upload_date.isoformat() if doc.upload_date else '',
                'file_size': file_size
            })
        
        return jsonify({
            'documents': formatted_docs
        }), 200
    except Exception as e:
        app.logger.error(f"Error fetching documents: {str(e)}")
        return jsonify({
            'error': 'Failed to fetch documents',
            'details': str(e)
        }), 500


@app.route('/api/documents/suggestions', methods=['GET'])
def get_document_suggestions():
    """Get document suggestions based on query"""
    try:
        query = request.args.get('query', '')
        logger.info(f"Fetching document suggestions with query: '{query}'")
        
        # Use the imported db_manager directly instead of get_db_manager()
        documents = db_manager.get_all_documents()
        logger.info(f"Found {len(documents)} documents in database")
        
        # Filter documents based on query if provided
        if query:
            filtered_docs = [doc for doc in documents if query.lower() in doc.filename.lower()]
            logger.info(f"Filtered to {len(filtered_docs)} documents matching query: '{query}'")
        else:
            filtered_docs = documents
            
        result = [{
            'id': str(doc.id),  # Convert to string for consistent handling in frontend
            'name': doc.filename,
            'type': doc.file_type
        } for doc in filtered_docs]
        
        logger.info(f"Returning {len(result)} document suggestions: {result}")
        return jsonify(result)
    except Exception as e:
        logger.error(f"Error fetching document suggestions: {str(e)}")
        return jsonify({"error": str(e)}), 500


@app.route('/api/query', methods=['POST'])
def execute_query():
    """Execute a query using either RAG (chat) or SQL (analytics) mode"""
    try:
        data = request.json
        query_text = data.get('query', '')
        mentions = data.get('mentions', [])  # Document references
        mode = data.get('mode', 'Chat')  # Default to Chat mode
        
        if not query_text:
            return jsonify({
                "success": False,
                "error": "No query provided"
            }), 400
        
        # Process document mentions
        document_ids = [int(mention['id']) for mention in mentions if mention.get('id')]
        logger.info(f"Processing query in {mode} mode with document IDs: {document_ids}")
        
        # Handle different modes
        if mode == 'Analytics':
            # Use SQL Agent for analytics mode
            if not sql_agent:
                return jsonify({
                    "success": False,
                    "error": "SQL Agent not initialized"
                }), 500
            
            # For Analytics mode, we need to match tables based on document timestamp, page numbers, and table indexes
            table_names = []
            
            for mention in mentions:
                # Extract the document ID from the mentions
                doc_id = mention.get('id', '')
                
                if not doc_id:
                    continue
                
                # Get the document from the database to retrieve its filename
                document = db_manager.get_document(int(doc_id))
                if not document:
                    logger.warning(f"Document with ID {doc_id} not found in database")
                    continue
                    
                # Get the base filename without extension
                base_filename = os.path.splitext(document.filename)[0]
                
                # Find the timestamp directory in EXTRACTED_CONTENT_FOLDER that matches this document
                timestamp_prefix = None
                folder_found = False
                
                for folder in os.listdir(EXTRACTED_CONTENT_FOLDER):
                    folder_path = os.path.join(EXTRACTED_CONTENT_FOLDER, folder)
                    if os.path.isdir(folder_path) and folder.endswith(f"_{base_filename}"):
                        # Extract the timestamp prefix from the folder name (everything before the first _)
                        timestamp_parts = folder.split('_', 1)
                        if len(timestamp_parts) >= 2:
                            timestamp_prefix = timestamp_parts[0]
                            folder_found = True
                            logger.info(f"Found matching directory: {folder_path}")
                            logger.info(f"Extracted timestamp prefix: {timestamp_prefix}")
                            break
                
                if not folder_found or not timestamp_prefix:
                    logger.warning(f"Could not find matching folder with timestamp for document: {document.filename}")
                    continue
                
                # Check if this document has table references
                table_references = mention.get('tableReferences', [])
                
                if table_references:
                    for table_ref in table_references:
                        page_number = table_ref.get('pageNumber', '')
                        table_number = table_ref.get('tableNumber', '')
                        
                        if page_number and table_number:
                            # Format: {timestamp prefix}_p{pagenumber}_{TableIndex}_{TableName}
                            # The TableName part may not be provided in the references, so we match on prefix
                            table_prefix = f"{timestamp_prefix}_p{page_number}_{table_number}_"
                            logger.info(f"Adding table prefix for matching: {table_prefix}")
                            table_names.append(table_prefix)
            
            logger.info(f"Table names/prefixes to query: {table_names}")
            
            # If no table references were provided, return an error
            if not table_names:
                return jsonify({
                    "success": False,
                    "error": "Please select at least one table reference using the '/' key after selecting a document."
                }), 400
            
            # Query the database using table prefixes
            result = sql_agent.query_database_by_table_names(table_names, query_text)
            
            if 'error' in result:
                return jsonify({
                    "success": False,
                    "error": result['error']
                }), 400
            
            return jsonify({
                "success": True,
                "response": result.get('answer', 'No answer found')
            })
        else:
            # Use RAG System for chat mode
            if not rag_system:
                return jsonify({
                    "success": False,
                    "error": "RAG System not initialized"
                }), 500
                
            # Check if document IDs are provided
            if not document_ids:
                return jsonify({
                    "success": False,
                    "error": "Please select at least one document to query. Click on a document in the left sidebar to select it."
                }), 400
                
            # Call RAG system with the query and document IDs
            result = rag_system.query(query_text, document_ids)
            
            if 'error' in result:
                logger.error(f"RAG system error: {result['error']}")
                return jsonify({
                    "success": False,
                    "error": result['error']
                }), 400
                
            return jsonify({
                "success": True,
                "response": result.get('answer', 'No answer found')
            })
            
    except Exception as e:
        logger.error(f"Error executing query: {str(e)}")
        return jsonify({
            "success": False,
            "error": f"An error occurred: {str(e)}"
        }), 500


@app.route('/api/upload', methods=['POST'])
def upload_document():
    """Upload and process a document"""
    try:
        # Check if the request contains a file
        if 'file' not in request.files:
            return jsonify({"success": False, "error": "No file provided"}), 400
            
        file = request.files['file']
        
        # Check if the file has a name
        if file.filename == '':
            return jsonify({"success": False, "error": "No file selected"}), 400
            
        # Check if the file has an allowed extension
        allowed_extensions = {'pdf'}
        if not file.filename.lower().endswith(tuple('.' + ext for ext in allowed_extensions)):
            return jsonify({
                "success": False, 
                "error": f"Invalid file type. Allowed types: {', '.join(allowed_extensions)}"
            }), 400
            
        # Create a unique filename using timestamp in base 36
        timestamp = int(time.time())
        # Convert timestamp to base 36
        chars = '0123456789abcdefghijklmnopqrstuvwxyz'
        base36_timestamp = ''
        temp = timestamp
        while temp > 0:
            base36_timestamp = chars[temp % 36] + base36_timestamp
            temp //= 36
        file_id = base36_timestamp

        # Extract just the original filename without any timestamp prefix
        original_filename = file.filename

        filename = f"{file_id}_{original_filename}"
        file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        
        # Ensure the upload directory exists
        os.makedirs(app.config['UPLOAD_FOLDER'], exist_ok=True)
        
        # Save the file
        file.save(file_path)
        
        # Create db record for the document
        doc_record = db_manager.add_document(
            filename=original_filename,
            file_path=file_path,
            file_type='pdf'
        )
        
        # Process the document (this could be done asynchronously)
        try:
            # Process file using PdfContentExtractor
            extractor = PdfContentExtractor(
                pdf_path=file_path, 
                output_folder=EXTRACTED_CONTENT_FOLDER
            )
            
            # Extract content
            results = extractor.extract_all()
            
            # Save extraction results
            output_file = extractor.save_extraction_results(
                format="json",
                load_tables_to_db=True,
                document_id=doc_record.id
            )
            
            # Update database record
            db_manager.update_document_status(
                document_id=doc_record.id,
                processed=True,
                error=None
            )
            
            # Add extraction path as content
            db_manager.add_extracted_content(
                document_id=doc_record.id,
                content_type='json',
                content_path=output_file
            )
            
            return jsonify({
                "success": True,
                "message": "Document uploaded and processed successfully",
                "document": {
                    "id": doc_record.id,
                    "filename": original_filename,
                    "processed": True
                }
            })
            
        except Exception as processing_error:
            logger.error(f"Error processing document: {str(processing_error)}")
            
            # Update database record with processing error
            db_manager.update_document_status(
                document_id=doc_record.id,
                processed=False,
                error=str(processing_error)
            )
            
            return jsonify({
                "success": False,
                "message": "Document uploaded but processing failed",
                "error": str(processing_error),
                "document": {
                    "id": doc_record.id,
                    "filename": original_filename,
                    "processed": False
                }
            }), 500
            
    except Exception as e:
        logger.error(f"Error uploading document: {str(e)}")
        return jsonify({
            "success": False,
            "error": f"An error occurred during upload: {str(e)}"
        }), 500


@app.route('/api/admin/cleanup', methods=['POST'])
def admin_cleanup():
    """Admin endpoint to clean up the database and file system"""
    try:
        # Get admin secret key from request (basic security measure)
        data = request.get_json() or {}
        admin_key = data.get('admin_key', '')
        
        # Check if the admin key matches the one in the environment
        expected_key = os.getenv('ADMIN_SECRET', SECRET_KEY)  # Fallback to app secret key
        if admin_key != expected_key:
            return jsonify({
                "success": False, 
                "error": "Unauthorized access"
            }), 401
            
        # Import the cleanup functions
        from cleanup import clear_database, clean_directory
        
        # Clear database
        clear_database()
        
        # Clean uploads directory
        uploads_dir = UPLOAD_FOLDER
        clean_directory(uploads_dir)
        
        # Clean extracted_content directory
        extracted_dir = EXTRACTED_CONTENT_FOLDER
        clean_directory(extracted_dir)
        
        return jsonify({
            "success": True,
            "message": "Database and file system cleanup completed successfully"
        })
    
    except Exception as e:
        logger.error(f"Cleanup failed: {str(e)}")
        return jsonify({
            "success": False,
            "error": f"Cleanup failed: {str(e)}"
        }), 500
        
        
@app.route('/api/documents/<string:document_id>', methods=['GET'])
def get_document(document_id):
    """Get a document and its extracted content by ID."""
    try:
        db_manager = get_db_manager()
        document = db_manager.get_document(document_id)
        
        if not document:
            return jsonify({'error': 'Document not found'}), 404
        
        # Get extracted contents associated with this document
        contents = db_manager.get_document_contents(document_id)
        
        # Format the document and its contents for the response
        document_data = {
            'id': document.id,
            'filename': document.filename,
            'file_path': document.file_path,
            'file_type': document.file_type,
            'upload_date': document.upload_date.isoformat(),
            'processed': document.processed,
            'processing_error': document.processing_error,
            'contents': [
                {
                    'id': content.id,
                    'content_type': content.content_type,
                    'content_path': content.content_path,
                    'content_text': content.content_text,
                    'page_number': content.page_number,
                    'extraction_date': content.extraction_date.isoformat()
                } for content in contents
            ]
        }
        
        return jsonify(document_data), 200
    
    except Exception as e:
        app.logger.error(f"Error retrieving document: {str(e)}")
        return jsonify({'error': f'Failed to retrieve document: {str(e)}'}), 500


@app.route('/api/documents/<string:document_id>', methods=['DELETE'])
def delete_document(document_id):
    """Delete a document and its extracted content."""
    try:
        # Convert the document ID from string to integer
        try:
            doc_id = int(document_id)
        except ValueError:
            return jsonify({'error': 'Invalid document ID'}), 400

        # Get the document from the database
        db_manager = get_db_manager()
        document = db_manager.get_document(doc_id)
        
        if not document:
            return jsonify({'error': 'Document not found'}), 404
        
        # Retrieve file paths and filename before deletion
        file_path = document.file_path
        filename = document.filename
        
        # Delete document from the database
        result = db_manager.delete_document(doc_id)
        if not result:
            return jsonify({'error': 'Failed to delete document from database'}), 500
        
        # Delete the original file
        if not os.path.isabs(file_path):
            original_file_path = os.path.join(UPLOAD_FOLDER, file_path)
        else:
            original_file_path = file_path
            
        if os.path.exists(original_file_path):
            try:
                os.remove(original_file_path)
                app.logger.info(f"Deleted file: {original_file_path}")
            except Exception as e:
                app.logger.warning(f"Failed to delete file {original_file_path}: {str(e)}")
        else:
            app.logger.warning(f"File not found for deletion: {original_file_path}")
        
        # Delete the extracted content directory
        # Assume the folder is named with a pattern {timestamp}_{base_filename}
        base_filename = os.path.splitext(filename)[0]
        # Iterate through directories in EXTRACTED_CONTENT_FOLDER looking for a match
        for folder in os.listdir(EXTRACTED_CONTENT_FOLDER):
            folder_path = os.path.join(EXTRACTED_CONTENT_FOLDER, folder)
            if os.path.isdir(folder_path) and folder.endswith(f"_{base_filename}"):
                try:
                    shutil.rmtree(folder_path)
                    app.logger.info(f"Deleted extracted content directory: {folder_path}")
                except Exception as e:
                    app.logger.warning(f"Failed to delete directory {folder_path}: {str(e)}")
        
        return jsonify({'message': 'Document deleted successfully'}), 200
    
    except Exception as e:
        app.logger.error(f"Error deleting document: {str(e)}")
        return jsonify({'error': f'Failed to delete document: {str(e)}'}), 500


@app.route('/api/documents/download', methods=['GET'])
def download_document():
    """Download a document by file path."""
    file_path = request.args.get('filePath')
    
    if not file_path:
        return jsonify({'error': 'File path is required'}), 400
    
    # Security check: ensure the file path is within the uploads directory
    uploads_dir = os.path.abspath(app.config['UPLOAD_FOLDER'])
    requested_path = os.path.abspath(file_path)
    
    if not requested_path.startswith(uploads_dir):
        return jsonify({'error': 'Invalid file path'}), 403
    
    if not os.path.exists(requested_path):
        return jsonify({'error': 'File not found'}), 404
    
    try:
        return send_file(
            requested_path,
            as_attachment=True,
            download_name=os.path.basename(requested_path)
        )
    except Exception as e:
        app.logger.error(f"Error downloading file: {str(e)}")
        return jsonify({'error': 'Failed to download file'}), 500
    
    
@app.route('/api/documents/<string:document_id>/tables', methods=['GET'])
def get_document_tables(document_id):
    """Get tables extracted from a document, organized by page."""
    try:
        # Convert the document ID from string to integer
        try:
            doc_id = int(document_id)
        except ValueError:
            logger.error(f"Invalid document ID format: {document_id}")
            return jsonify({'error': 'Invalid document ID'}), 400
            
        # Get the document first to retrieve its filename
        db_manager = get_db_manager()
        document = db_manager.get_document(doc_id)
        
        if not document:
            logger.error(f"Document not found with ID: {doc_id}")
            return jsonify({'error': 'Document not found'}), 404
        
        # Get the base filename without extension
        base_filename = os.path.splitext(document.filename)[0]
        logger.info(f"Looking for tables for base filename: {base_filename}")
        
        # Find the extracted content directory that matches this document
        timestamp_dirs = []
        logger.info(f"Searching in extracted content folder: {EXTRACTED_CONTENT_FOLDER}")
        
        for folder in os.listdir(EXTRACTED_CONTENT_FOLDER):
            folder_path = os.path.join(EXTRACTED_CONTENT_FOLDER, folder)
            if os.path.isdir(folder_path) and folder.endswith(f"_{base_filename}"):
                # This is a matching directory
                timestamp_dirs.append(folder_path)
                logger.info(f"Found matching directory: {folder_path}")
                
                # Extract the timestamp prefix for logging
                timestamp_parts = folder.split('_', 1)
                if len(timestamp_parts) >= 2:
                    timestamp_prefix = timestamp_parts[0]
                    logger.info(f"Extracted timestamp prefix: {timestamp_prefix}")
        
        # If no timestamp directory found, return empty result
        if not timestamp_dirs:
            logger.warning(f"No extracted content directory found for document ID: {doc_id}")
            return jsonify([]), 200
            
        # Use the most recent timestamp directory (assuming it's sorted alphanumerically)
        # Or simply use the only one if there's just one
        tables_folder = os.path.join(sorted(timestamp_dirs)[-1], 'tables')
        logger.info(f"Using tables folder: {tables_folder}")
        
        # Check if the tables directory exists
        if not os.path.exists(tables_folder) or not os.path.isdir(tables_folder):
            return jsonify([]), 200  # Return empty array if no tables folder exists
        
        # Get all markdown files in the tables directory
        table_files = [f for f in os.listdir(tables_folder) if f.endswith('.md')]
        logger.info(f"Found {len(table_files)} markdown files in tables folder")
        
        # Organize tables by page
        tables_by_page = []
        
        for file in sorted(table_files):
            # Extract page number from filename (format: p{pageNumber}.md)
            if not file.startswith('p') or not file[1:-3].isdigit():
                logger.warning(f"Skipping file with invalid name format: {file}")
                continue
                
            page_number = int(file[1:-3])  # Extract the number between 'p' and '.md'
            file_path = os.path.join(tables_folder, file)
            
            # Read the markdown content
            try:
                with open(file_path, 'r', encoding='utf-8') as f:
                    markdown_content = f.read()
                    
                # Add to the result array
                tables_by_page.append({
                    'page_number': page_number,
                    'markdown_content': markdown_content,
                    'file_name': file
                })
                logger.info(f"Added table from file: {file}")
            except Exception as e:
                logger.warning(f"Failed to read table file {file_path}: {str(e)}")
                # Continue with other files even if one fails

        # Sort by page number
        tables_by_page = sorted(tables_by_page, key=lambda x: x['page_number'])
        
        # If no tables were found despite the folder existing, provide debug info
        if len(tables_by_page) == 0:
            logger.warning(f"No tables found in folder: {tables_folder}")
            return jsonify({
                'error': 'No tables found',
                'tables_folder': tables_folder,
                'files_in_folder': os.listdir(tables_folder)
            }), 200
        
        return jsonify(tables_by_page), 200
    
    except Exception as e:
        app.logger.error(f"Error retrieving document tables: {str(e)}")
        return jsonify({'error': f'Failed to retrieve tables: {str(e)}'}), 500


@app.route('/api/debug/tables/<string:document_id>', methods=['GET'])
def debug_document_tables(document_id):
    """Debug endpoint to check table files for a document."""
    try:
        # Convert the document ID from string to integer
        try:
            doc_id = int(document_id)
        except ValueError:
            return jsonify({'error': 'Invalid document ID'}), 400
            
        # Get the document first to retrieve its filename
        db_manager = get_db_manager()
        document = db_manager.get_document(doc_id)
        
        if not document:
            return jsonify({'error': 'Document not found'}), 404
        
        # Get the base filename without extension
        base_filename = os.path.splitext(document.filename)[0]
        
        # Find the extracted content directory that matches this document
        timestamp_dirs = []
        logger.info(f"Searching in extracted content folder: {EXTRACTED_CONTENT_FOLDER}")
        
        for folder in os.listdir(EXTRACTED_CONTENT_FOLDER):
            folder_path = os.path.join(EXTRACTED_CONTENT_FOLDER, folder)
            if os.path.isdir(folder_path) and folder.endswith(f"_{base_filename}"):
                # This is a matching directory
                timestamp_dirs.append(folder_path)
                logger.info(f"Found matching directory: {folder_path}")
                
                # Extract the timestamp prefix for logging
                timestamp_parts = folder.split('_', 1)
                if len(timestamp_parts) >= 2:
                    timestamp_prefix = timestamp_parts[0]
                    logger.info(f"Extracted timestamp prefix: {timestamp_prefix}")
        
        # If no timestamp directory found, return empty result
        if not timestamp_dirs:
            logger.warning(f"No extracted content directory found for document ID: {doc_id}")
            return jsonify([]), 200
            
        # Use the most recent timestamp directory
        content_dir = sorted(timestamp_dirs)[-1]
        tables_folder = os.path.join(content_dir, 'tables')
        
        # Debug information
        debug_info = {
            'document_id': doc_id,
            'document_filename': document.filename,
            'base_filename': base_filename,
            'content_dir': content_dir,
            'tables_folder': tables_folder,
            'tables_folder_exists': os.path.exists(tables_folder) and os.path.isdir(tables_folder),
            'files_in_content_dir': os.listdir(content_dir) if os.path.exists(content_dir) else [],
        }
        
        # If tables folder exists, list its files
        if os.path.exists(tables_folder) and os.path.isdir(tables_folder):
            debug_info['files_in_tables_folder'] = os.listdir(tables_folder)
            
            # If there are markdown files, get their content
            md_files = [f for f in os.listdir(tables_folder) if f.endswith('.md')]
            if md_files:
                sample_file = os.path.join(tables_folder, md_files[0])
                try:
                    with open(sample_file, 'r', encoding='utf-8') as f:
                        debug_info['sample_content'] = f.read()[:500]  # First 500 chars
                except Exception as e:
                    debug_info['sample_content_error'] = str(e)
        
        return jsonify(debug_info), 200
    
    except Exception as e:
        logger.error(f"Debug error: {str(e)}")
        return jsonify({'error': str(e)}), 500


# Error handlers
@app.errorhandler(404)
def not_found(error):
    return jsonify({"error": "Resource not found"}), 404


@app.errorhandler(500)
def server_error(error):
    return jsonify({"error": "Internal server error"}), 500


# Helper function to get database manager
def get_db_manager():
    try:
        return db_manager
    except Exception as e:
        app.logger.error(f"Error downloading file: {str(e)}")
        return jsonify({'error': 'Failed to download file'}), 500


# Error handlers
@app.errorhandler(404)
def not_found(error):
    return jsonify({"error": "Resource not found"}), 404


@app.errorhandler(500)
def server_error(error):
    return jsonify({"error": "Internal server error"}), 500


if __name__ == '__main__':
    app.run(debug=DEBUG, host='0.0.0.0', port=5001) 