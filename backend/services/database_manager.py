from sqlalchemy import create_engine, Column, Integer, String, Text, DateTime, Boolean, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, relationship
import datetime
import logging
import sys
import os

# Add the parent directory to the path for importing app modules
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from app.core.config import DATABASE_URI

# Set up logging
logger = logging.getLogger(__name__)

# Create the base class for declarative models
Base = declarative_base()

# Define models
class Document(Base):
    __tablename__ = 'documents'
    
    id = Column(Integer, primary_key=True)
    filename = Column(String(255), nullable=False)
    file_path = Column(String(255), nullable=False)
    file_type = Column(String(50), nullable=False)
    upload_date = Column(DateTime, default=datetime.datetime.utcnow)
    processed = Column(Boolean, default=False)
    processing_error = Column(Text, nullable=True)
    
    # Relationship with ExtractedContent
    contents = relationship("ExtractedContent", back_populates="document", cascade="all, delete-orphan")
    
    def __repr__(self):
        return f"<Document(id={self.id}, filename='{self.filename}', type='{self.file_type}')>"


class ExtractedContent(Base):
    __tablename__ = 'extracted_contents'
    
    id = Column(Integer, primary_key=True)
    document_id = Column(Integer, ForeignKey('documents.id'), nullable=False)
    content_type = Column(String(50), nullable=False)  # e.g., 'text', 'image', 'table'
    content_path = Column(String(255), nullable=True)  # If stored as a file
    content_text = Column(Text, nullable=True)        # If stored as text
    extraction_date = Column(DateTime, default=datetime.datetime.utcnow)
    page_number = Column(Integer, nullable=True)
    
    # Relationship with Document
    document = relationship("Document", back_populates="contents")
    
    def __repr__(self):
        return f"<ExtractedContent(id={self.id}, document_id={self.document_id}, type='{self.content_type}')>"


class DatabaseManager:
    def __init__(self):
        try:
            self.engine = create_engine(DATABASE_URI)
            self.Session = sessionmaker(bind=self.engine)
            self.session = None
            logger.info(f"Database engine created with URI: {DATABASE_URI}")
        except Exception as e:
            logger.error(f"Failed to create database engine: {str(e)}")
            raise

    def create_tables(self):
        """Create all tables defined in the models"""
        try:
            Base.metadata.create_all(self.engine)
            logger.info("Database tables created successfully")
        except Exception as e:
            logger.error(f"Failed to create database tables: {str(e)}")
            raise

    def get_session(self):
        """Get a new session"""
        if not self.session:
            self.session = self.Session()
        return self.session

    def close_session(self):
        """Close the current session"""
        if self.session:
            self.session.close()
            self.session = None

    def add_document(self, filename, file_path, file_type):
        """Add a new document to the database"""
        session = self.get_session()
        try:
            document = Document(
                filename=filename,
                file_path=file_path,
                file_type=file_type
            )
            session.add(document)
            session.commit()
            logger.info(f"Added document: {filename}")
            return document
        except Exception as e:
            session.rollback()
            logger.error(f"Failed to add document: {str(e)}")
            raise
    
    def add_extracted_content(self, document_id, content_type, content_path=None, 
                              content_text=None, page_number=None):
        """Add extracted content for a document"""
        session = self.get_session()
        try:
            content = ExtractedContent(
                document_id=document_id,
                content_type=content_type,
                content_path=content_path,
                content_text=content_text,
                page_number=page_number
            )
            session.add(content)
            session.commit()
            logger.info(f"Added extracted content for document ID: {document_id}")
            return content
        except Exception as e:
            session.rollback()
            logger.error(f"Failed to add extracted content: {str(e)}")
            raise
    
    def get_document(self, document_id):
        """Get a document by ID"""
        session = self.get_session()
        return session.query(Document).filter(Document.id == document_id).first()
    
    def get_all_documents(self):
        """Get all documents"""
        session = self.get_session()
        return session.query(Document).all()
    
    def update_document_status(self, document_id, processed=True, error=None):
        """Update the processing status of a document"""
        session = self.get_session()
        try:
            document = session.query(Document).filter(Document.id == document_id).first()
            if document:
                document.processed = processed
                document.processing_error = error
                session.commit()
                logger.info(f"Updated status for document ID: {document_id}")
                return True
            return False
        except Exception as e:
            session.rollback()
            logger.error(f"Failed to update document status: {str(e)}")
            raise
    
    def get_document_contents(self, document_id):
        """Get all extracted content for a document"""
        session = self.get_session()
        return session.query(ExtractedContent).filter(
            ExtractedContent.document_id == document_id
        ).all()
        

    def delete_document(self, document_id):
        """Delete a document and its associated extracted content records from the database"""
        session = self.get_session()
        try:
            # Get the document first
            document = session.query(Document).filter(Document.id == document_id).first()
            
            if not document:
                logger.warning(f"Attempted to delete non-existent document with ID: {document_id}")
                return False
            
            # Delete the document (cascade will handle deleting related ExtractedContent entries)
            session.delete(document)
            session.commit()
            logger.info(f"Deleted document with ID: {document_id}")
            return True
        except Exception as e:
            session.rollback()
            logger.error(f"Failed to delete document: {str(e)}")
            raise
    def delete_document(self, document_id):
        """Delete a document and its associated content from the database"""
        session = self.get_session()
        try:
            document = session.query(Document).filter(Document.id == document_id).first()
            if not document:
                return False
                
            # Document will cascade delete its contents due to the relationship config
            session.delete(document)
            session.commit()
            logger.info(f"Deleted document ID: {document_id} from database")
            return True
        except Exception as e:
            session.rollback()
            logger.error(f"Failed to delete document: {str(e)}")
            raise


# Initialize database manager
db_manager = DatabaseManager()

# Create tables if they don't exist
def init_db():
    db_manager.create_tables()
    logger.info("Database initialized")

if __name__ == "__main__":
    # Create tables when script is run directly
    init_db() 