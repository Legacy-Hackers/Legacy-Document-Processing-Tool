import os
from pathlib import Path
from dotenv import load_dotenv

load_dotenv()

BASE_DIR = Path(__file__).resolve().parent

DEBUG = os.getenv("DEBUG", "True").lower() == "true"
SECRET_KEY = os.getenv("SECRET_KEY", "your-secret-key-for-development")

USE_POSTGRESQL = os.getenv("USE_POSTGRESQL", "true").lower() == "true"
DB_NAME = os.getenv("DB_NAME", "legacy_data")
DB_USER = os.getenv("DB_USER", "postgres")
DB_PASS = os.getenv("DB_PASS", "password")
DB_HOST = os.getenv("DB_HOST", "localhost")
DB_PORT = os.getenv("DB_PORT", "5432")

if USE_POSTGRESQL:
    DATABASE_URL = f"postgresql://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
else:
    DATABASE_URL = f"sqlite:///{BASE_DIR}/data/{DB_NAME}.db"

UPLOAD_FOLDER = os.path.join(BASE_DIR, "uploads")
EXTRACTED_CONTENT_DIR = os.path.join(BASE_DIR, "extracted_content")
ORIGINAL_PDFS_DIR = os.path.join(BASE_DIR, "original_pdfs")