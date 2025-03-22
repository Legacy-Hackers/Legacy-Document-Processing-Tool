# Legacy Document Processing Tool - Backend

This is the backend for the Legacy Document Processing Tool, a Flask-based application that processes legacy documents.

## Setup

1. Create a virtual environment (recommended):
   ```
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

2. Install dependencies:
   ```
   pip install -r requirements.txt
   ```

3. Configure environment variables:
   Create a `.env` file in the project root with the following variables (or copy from the parent directory):
   ```
   # Application settings
   DEBUG=True
   SECRET_KEY=your_secret_key

   # Database choice
   USE_POSTGRESQL=true  # Set to "false" to use SQLite instead

   # PostgreSQL settings (used when USE_POSTGRESQL is true)
   DB_NAME=legacy_data
   DB_USER=your_db_user
   DB_PASS=your_db_password
   DB_HOST=localhost
   DB_PORT=5432
   ```

4. Run the application:
   ```
   python app.py
   ```

The server will start on `http://localhost:5000`.

## API Endpoints

- `GET /api/health` - Health check endpoint
- `GET /api/documents` - Get all documents

## Database

The application can use either PostgreSQL (recommended for production) or SQLite (for development). Configure your preference in the `.env` file.

- PostgreSQL: Set `USE_POSTGRESQL=true` and provide the connection details
- SQLite: Set `USE_POSTGRESQL=false` (a SQLite database file will be created automatically)

## Project Structure

- `app/` - Main application package
  - `core/` - Core configurations and utilities
  - `Content_Extractors/` - Document content extraction modules
- `services/` - Backend services
  - `database_manager.py` - Database connection and operations
- `app.py` - Main Flask application file 