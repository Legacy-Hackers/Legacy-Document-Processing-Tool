import os
from dotenv import load_dotenv
import logging

# Load environment variables from .env file
load_dotenv()

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Application settings
DEBUG = os.getenv("DEBUG", "False").lower() == "true"
SECRET_KEY = os.getenv("SECRET_KEY", "default-secret-key")

# Database settings
USE_POSTGRESQL = os.getenv("USE_POSTGRESQL", "false").lower() == "true"
USE_SQLITE = os.getenv("USE_SQLITE", "true").lower() == "true"

# PostgreSQL settings
DB_NAME = os.getenv("DB_NAME", "legacy_data")
DB_USER = os.getenv("DB_USER", "postgres")
DB_PASS = os.getenv("DB_PASS", "")
DB_HOST = os.getenv("DB_HOST", "localhost")
DB_PORT = os.getenv("DB_PORT", "5432")

# File upload settings
UPLOAD_FOLDER = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "uploads")
EXTRACTED_CONTENT_FOLDER = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "extracted_content")

# Ensure directories exist
os.makedirs(UPLOAD_FOLDER, exist_ok=True)
os.makedirs(EXTRACTED_CONTENT_FOLDER, exist_ok=True)

# Database connection string
if USE_POSTGRESQL:
    DATABASE_URI = f"postgresql://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
else:
    # SQLite as fallback
    DATABASE_URI = f"sqlite:///{os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), 'database.db')}"

logger.info(f"Using database: {'PostgreSQL' if USE_POSTGRESQL else 'SQLite'}") 