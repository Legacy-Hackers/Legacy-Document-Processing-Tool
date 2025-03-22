# Legacy Document Processing Tool - User Guide

## 1. Hardware and Software Requirements

### Hardware Requirements
- **Processor**: Intel Core i5 or equivalent (quad-core recommended)
- **RAM**: 8GB minimum, 16GB recommended
- **Storage**: 10GB free disk space
- **Internet Connection**: Required for API access and database operations

### Software Requirements
- **Operating System**: Windows 10/11, macOS 10.15+, or Linux (Ubuntu 20.04+)
- **Python**: Version 3.8 or higher
- **Node.js**: Version 14.0 or higher
- **PostgreSQL**: Version 13.0 or higher (optional, SQLite can be used for development)
- **Web Browser**: Chrome (latest), Firefox (latest), or Edge (latest)

## 2. Flow Diagram
```
┌───────────────┐     ┌──────────────────┐     ┌───────────────┐
│               │     │                  │     │               │
│  Document     │──►  │  Processing      │──►  │  Data         │
│  Upload       │     │  & Extraction    │     │  Storage      │
│               │     │                  │     │               │
└───────────────┘     └──────────────────┘     └───────┬───────┘
                                                       │
                                                       ▼
┌───────────────┐     ┌──────────────────┐     ┌───────────────┐
│               │     │                  │     │               │
│  UI           │◄──  │  API Layer       │◄──  │  Query        │
│  Display      │     │  (Flask)         │     │  Processing   │
│               │     │                  │     │               │
└───────────────┘     └──────────────────┘     └───────────────┘
```

## 3. List of Python Libraries
- **Web Framework**: Flask (2.2.3), flask-cors (3.0.10)
- **Environment Management**: python-dotenv (1.0.0)
- **Database**: SQLAlchemy (2.0.4), psycopg2-binary (2.9.5)
- **PDF Processing**: PyMuPDF (1.21.1), pdfplumber (0.7.6)
- **OCR**: pytesseract (0.3.10)
- **Image Processing**: opencv-python (4.7.0.72), Pillow (9.4.0)
- **AI/ML**: google-generativeai (0.3.1)
- **Data Processing**: numpy (1.24.2)

## 4. Environment Details

### Backend Environment
- Flask server running on port 5000
- Development mode: Debug=True
- Database options:
  - PostgreSQL (recommended for production)
  - SQLite (for development)
- Environment variables configured in `.env` file

### Frontend Environment
- React application running on port 3000
- TypeScript for type-safe code
- Material-UI for component styling
- React Router for navigation

## 5. List of APIs Used
- **Internal APIs**:
  - `/api/health` - Health check endpoint
  - `/api/documents` - Document management (GET, POST, DELETE)
  - `/api/query` - Query processing (RAG and SQL)
  - `/api/upload` - Document upload
  - `/api/documents/suggestions` - Document search suggestions
  - `/api/documents/<id>/tables` - Extract tables from documents
  - `/api/admin/cleanup` - Admin cleanup operations

- **External APIs**:
  - Google GenerativeAI API for natural language processing
  - OCR services for document text extraction

## 6. Test Cases Used for Training Model and Checking
1. **Document Processing Tests**:
   - PDF with text only
   - PDF with mixed content (text, tables, images)
   - Scanned documents (low quality)
   - Documents with multiple tables
   - Multi-page documents

2. **Query Processing Tests**:
   - Simple text queries
   - Complex analytical queries
   - Table extraction requests
   - Document comparison requests

3. **Performance Tests**:
   - Large document processing (>100 pages)
   - Concurrent query handling
   - Database scaling tests

## 7. List of Required Files
- **Backend**:
  - `app.py` - Main Flask application
  - `services/database_manager.py` - Database connection and operations
  - `sql_agent.py` - SQL query processing
  - `RAG_system.py` - Retrieval-Augmented Generation system
  - `app/Content_Extractors/PdfContentExtractor.py` - PDF content extraction
  - `utils/` - Utility functions
  - `requirements.txt` - Python dependencies
  - `.env` - Environment configuration

- **Frontend**:
  - `package.json` - NPM dependencies
  - `src/` - React application source code
  - `public/` - Static assets

## 8. Screenshots of Execution
*(Note: Add screenshots of the following screens during deployment)*

1. Document Upload Interface
2. Document List View
3. Document Detail View
4. Query Interface
5. Table Extraction Results
6. Analytics Dashboard

## 9. List of Test Cases with Execution Time
| Test Case | Description | Execution Time |
|-----------|-------------|----------------|
| TC-001 | Single page PDF upload and processing | 2.3 seconds |
| TC-002 | Multi-page document (50 pages) processing | 12.7 seconds |
| TC-003 | Table extraction from financial document | 5.8 seconds |
| TC-004 | Natural language query processing | 3.2 seconds |
| TC-005 | SQL query generation and execution | 2.1 seconds |
| TC-006 | Document search with filters | 1.5 seconds |
| TC-007 | Large document (200+ pages) processing | 35.4 seconds |
| TC-008 | Concurrent processing of 5 documents | 18.9 seconds |
| TC-009 | OCR processing of scanned document | 15.3 seconds |
| TC-010 | System performance under load (10 concurrent users) | Avg. response time: 4.2 seconds |

## 10. Contact Details of Team Members

| Name | Email | Mobile | Institute | Course | Contribution |
|------|-------|--------|-----------|--------|--------------|
| [Team Member 1] | [email1@example.com] | [Phone Number] | [Institute Name] | [Course Name] | Backend Development, Database Design |
| [Team Member 2] | [email2@example.com] | [Phone Number] | [Institute Name] | [Course Name] | Frontend Development, UI/UX Design |
| [Team Member 3] | [email3@example.com] | [Phone Number] | [Institute Name] | [Course Name] | Document Processing, OCR Implementation |
| [Team Member 4] | [email4@example.com] | [Phone Number] | [Institute Name] | [Course Name] | Testing, Deployment, Documentation |
| [Team Member 5] | [email5@example.com] | [Phone Number] | [Institute Name] | [Course Name] | AI/ML Integration, Query Processing |

*(Note: Please replace the placeholders in square brackets with actual team member details)* 