# Legacy Document Processing Tool

A modern web application for processing, analyzing, and querying legacy documents. This system provides sophisticated document management capabilities including OCR processing, content extraction, and natural language querying.

## Features

- **Document Upload**: Easily upload PDF documents to the system
- **Content Extraction**: Automatic extraction of text, tables, and other content from PDFs
- **Intelligent Querying**: Natural language query capabilities using RAG (Retrieval Augmented Generation)
- **Table Extraction**: Identifies and extracts tables from documents
- **Document Management**: Organize, search, and filter your document collection
- **Responsive UI**: Modern Material-UI based interface that works on desktop and mobile

## Technology Stack

### Backend
- **Framework**: Flask (Python)
- **Document Processing**: PyMuPDF, pdfplumber, pytesseract (OCR)
- **AI/ML**: Google Generative AI for natural language processing
- **Database**: SQLAlchemy with PostgreSQL/SQLite support

### Frontend
- **Framework**: React with TypeScript
- **UI Library**: Material-UI (MUI)
- **State Management**: React Hooks
- **Routing**: React Router

## Getting Started

### Prerequisites

- Python 3.8+
- Node.js 14+
- PostgreSQL (optional, SQLite can be used for development)
- Tesseract OCR (for OCR capabilities)

### Backend Setup

1. Navigate to the backend directory:
   ```bash
   cd backend
   ```

2. Create a virtual environment:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

4. Set up environment variables by copying the example file:
   ```bash
   cp .env.example .env
   ```
   
5. Edit the `.env` file with your configuration settings

6. Start the Flask server:
   ```bash
   python app.py
   ```

### Frontend Setup

1. Navigate to the frontend directory:
   ```bash
   cd frontend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Start the development server:
   ```bash
   npm start
   ```

4. The application will be available at http://localhost:3000

### Environment Variables

The system uses environment variables to configure various aspects. These are stored in `.env` files in both the root and backend directories. Here's the structure:

#### Backend Environment Variables

```
# Application settings
DEBUG=True                  # Enable/disable debug mode
SECRET_KEY=your_secret_key  # Flask application secret key

# Database choice
USE_POSTGRESQL=true         # Set to "true" to use PostgreSQL, "false" for SQLite
USE_SQLITE=false            # Should be opposite of USE_POSTGRESQL

# PostgreSQL Database settings
DB_NAME=legacy_data         # Database name
DB_USER=username            # Database username
DB_PASS=password            # Database password  
DB_HOST=localhost           # Database host
DB_PORT=5432                # Database port

# PostgreSQL settings specifically for SQLAgent
PG_HOST=localhost           # Same as DB_HOST
PG_PORT=5432                # Same as DB_PORT
PG_USER=username            # Same as DB_USER
PG_PASSWORD=password        # Same as DB_PASS
PG_DATABASE=legacy_data     # Same as DB_NAME

# API Keys
GOOGLE_API_KEY=your_api_key # Google Generative AI API key
GEMINI_KEYS="key1 key2..."  # Space-separated list of Gemini API keys for load balancing
```

Make sure to replace default values with your actual configuration. Never commit `.env` files with real credentials to version control.

## Usage Guide

### Uploading Documents
1. Navigate to the "Upload Documents" page
2. Drag and drop your PDF files or click to browse
3. The system will process the documents and extract content

### Querying Documents
1. Go to the "Query Tool" page
2. Enter your query in natural language
3. The system will return relevant information from your document collection

### Managing Documents
1. Visit the "My Documents" page to see all uploaded documents
2. Use search and filters to find specific documents
3. Click on a document to view details or download

## API Reference

The backend provides the following API endpoints:

- `GET /api/health` - Health check endpoint
- `GET /api/documents` - Retrieve all documents
- `POST /api/upload` - Upload new documents
- `GET /api/documents/<id>` - Get specific document
- `DELETE /api/documents/<id>` - Delete a document
- `POST /api/query` - Query documents using natural language
- `GET /api/documents/<id>/tables` - Extract tables from documents
- `GET /api/documents/suggestions` - Get document search suggestions

## Development

### Project Structure

```
legacy_document_processing_tool/
├── backend/
│   ├── app/
│   │   ├── Content_Extractors/
│   │   └── core/
│   ├── services/
│   ├── utils/
│   ├── app.py
│   ├── RAG_system.py
│   ├── sql_agent.py
│   └── requirements.txt
└── frontend/
    ├── public/
    ├── src/
    │   ├── api/
    │   ├── components/
    │   ├── layout/
    │   ├── pages/
    │   ├── services/
    │   └── theme/
    ├── package.json
    └── tsconfig.json
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
