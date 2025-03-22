import os
import sys
import time
from pathlib import Path
from typing import List, Dict, Any, Optional, Union
from dotenv import load_dotenv
from langchain.document_loaders import JSONLoader
from langchain_text_splitters import RecursiveCharacterTextSplitter
from langchain_community.vectorstores import FAISS
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_google_genai import ChatGoogleGenerativeAI
from langchain_core.prompts import ChatPromptTemplate
from langchain.chains.combine_documents import create_stuff_documents_chain
from langchain.chains import create_retrieval_chain
from langchain.schema import Document
from langchain_core.output_parsers import StrOutputParser
from langchain.globals import set_llm_cache
from langchain.cache import InMemoryCache
from rich.console import Console
from rich.markdown import Markdown

# Initialize console for rich output
console = Console()

class RAGSystem:
    """
    A modular Retrieval-Augmented Generation (RAG) system that can be easily used across projects.
    """
    
    def __init__(
        self, 
        workspace_dir: Optional[Union[str, Path]] = None,
        json_data_path: str = "extraction_results.json",
        vector_store_path: Optional[str] = None,
        chunk_size: int = 7000,
        chunk_overlap: int = 1000,
        model_name: str = "gemini-2.0-flash",
        embedding_model: str = "jinaai/jina-embeddings-v2-small-en",
        load_env: bool = True,
        enable_cache: bool = True,
        verbose: bool = True
    ):
        """
        Initialize the RAG system with customizable parameters.
        
        Args:
            workspace_dir: Base directory for file operations. If None, uses current working directory.
            json_data_path: Path to the JSON data file (relative to workspace_dir).
            vector_store_path: Path to store/load vector store. If None, uses workspace_dir.
            chunk_size: Size of document chunks for splitting.
            chunk_overlap: Overlap between document chunks.
            model_name: Name of the LLM model to use.
            embedding_model: Name of the embedding model to use.
            load_env: Whether to load environment variables from .env file.
            enable_cache: Whether to enable LLM response caching.
            verbose: Whether to print detailed logs.
        """
        # Set up workspace directory
        if workspace_dir is None:
            self.workspace_dir = Path(os.getcwd())
        else:
            self.workspace_dir = Path(workspace_dir)
        
        # Set configuration
        self.json_data_path = json_data_path
        self.vector_store_path = vector_store_path or str(self.workspace_dir / "vector_store")
        self.chunk_size = chunk_size
        self.chunk_overlap = chunk_overlap
        self.model_name = model_name
        self.embedding_model = embedding_model
        self.verbose = verbose
        
        # Load environment variables if requested
        if load_env:
            load_dotenv()
        
        # Setup caching if requested
        if enable_cache:
            set_llm_cache(InMemoryCache())
        
        # Initialize system components
        self.docs = None
        self.split_docs = None
        self.vector_store = None
        self.llm = None
        self.chain = None
        
        if self.verbose:
            self.log(f"RAG System initialized with workspace: {self.workspace_dir}")
    
    def log(self, message: str) -> None:
        """Print log messages if verbose mode is enabled."""
        if self.verbose:
            console.print(message)
    
    def metadata_func(self, record: dict, metadata: dict) -> dict:
        """Extract metadata from each record in the JSON file"""
        metadata["document_type"] = record.get("document_type")
        metadata["title"] = record.get("title")
        metadata["author"] = record.get("author")
        metadata["page_number"] = record.get("page_number")
        return metadata
    
    def load_documents(self, file_path: Optional[str] = None) -> List[Document]:
        """
        Load documents from JSON file with error handling and include page numbers in content.
        
        Args:
            file_path: Path to the JSON file (overrides the one set during initialization)
            
        Returns:
            List of Document objects
        """
        file_path = file_path or self.json_data_path
        
        try:
            # Check if the file exists at the specified path
            full_path = self.workspace_dir / file_path
            
            if not os.path.exists(full_path):
                self.log(f"❌ File not found at {full_path}")
                # Try to find the file in the workspace directory
                for f in os.listdir(self.workspace_dir):
                    if f.endswith('.json'):
                        self.log(f"📂 Found JSON file: {f}. Using this file instead.")
                        file_path = f  # Update file path
                        full_path = self.workspace_dir / file_path
                        break
            
            self.log(f"📄 Loading from: {full_path}")
            
            # Load JSON data with LangChain's JSONLoader
            loader = JSONLoader(
                file_path=str(full_path),
                jq_schema=".pages[]",  # Extracts each page as a separate document
                content_key="page_content",  # The key containing the actual text
                metadata_func=self.metadata_func,
            )
            
            # Load initial documents
            initial_docs = loader.load()
            self.log(f"✅ Loaded {len(initial_docs)} initial documents from {file_path}")
            
            # Create new documents with page numbers included in content
            docs_with_page_numbers = []
            for doc in initial_docs:
                page_number = doc.metadata.get("page_number", "unknown")
                # Include page number at the beginning of content for better searchability
                enhanced_content = f"[Page: {page_number}] {doc.page_content}"
                
                # Create new document with enhanced content
                enhanced_doc = Document(
                    page_content=enhanced_content,
                    metadata=doc.metadata
                )
                docs_with_page_numbers.append(enhanced_doc)
            
            self.log(f"✅ Enhanced {len(docs_with_page_numbers)} documents with page numbers in content")
            
            if docs_with_page_numbers and len(docs_with_page_numbers) > 0 and self.verbose:
                self.log("Sample document with page number:")
                self.log(f"First 100 chars: {docs_with_page_numbers[0].page_content[:100]}...")
                self.log(f"Metadata: {docs_with_page_numbers[0].metadata}")
            
            self.docs = docs_with_page_numbers
            return docs_with_page_numbers
            
        except Exception as e:
            self.log(f"❌ Error loading documents: {str(e)}")
            return []
    
    def split_documents(self, 
                      docs: Optional[List[Document]] = None, 
                      chunk_size: Optional[int] = None, 
                      chunk_overlap: Optional[int] = None) -> List[Document]:
        """
        Split documents into chunks for better processing while preserving page number annotations.
        
        Args:
            docs: List of documents to split (uses self.docs if None)
            chunk_size: Size of chunks (overrides the one set during initialization)
            chunk_overlap: Overlap between chunks (overrides the one set during initialization)
            
        Returns:
            List of split Document objects
        """
        docs = docs or self.docs
        chunk_size = chunk_size or self.chunk_size
        chunk_overlap = chunk_overlap or self.chunk_overlap
        
        if not docs:
            self.log("❌ No documents to split")
            return []
        
        # Split documents into manageable chunks
        text_splitter = RecursiveCharacterTextSplitter(
            chunk_size=chunk_size, 
            chunk_overlap=chunk_overlap,
            length_function=len,
            # Add a separator to avoid breaking the "[Page: X]" annotations
            separators=["\n\n", "\n", " ", ""]
        )
        
        # Apply splitting to our documents
        start_time = time.time()
        split_docs = text_splitter.split_documents(docs)
        end_time = time.time()
        
        # Ensure page numbers are preserved in all chunks
        for i, doc in enumerate(split_docs):
            # If the page annotation was lost during splitting, re-add it
            if not doc.page_content.strip().startswith("[Page:"):
                page_number = doc.metadata.get("page_number", "unknown")
                doc.page_content = f"[Page: {page_number}] {doc.page_content}"
        
        self.log(f"✅ Split {len(docs)} documents into {len(split_docs)} chunks in {end_time - start_time:.2f} seconds")
        self.log(f"✅ Ensured all chunks preserve page number annotations")
        
        self.split_docs = split_docs
        return split_docs
    
    def initialize_vector_store(self, 
                              docs: Optional[List[Document]] = None, 
                              embedding_model: Optional[str] = None,
                              store_path: Optional[str] = None,
                              force_rebuild: bool = False) -> Optional[FAISS]:
        """
        Initialize or load vector store with document embeddings.
        
        Args:
            docs: List of documents to embed (uses self.split_docs if None)
            embedding_model: Name of embedding model (overrides the one set during initialization)
            store_path: Path to store/load vector store (overrides the one set during initialization)
            force_rebuild: Whether to force rebuilding the vector store even if it exists
            
        Returns:
            FAISS vector store or None if failed
        """
        docs = docs or self.split_docs
        embedding_model = embedding_model or self.embedding_model
        store_path = store_path or self.vector_store_path
        
        if not docs:
            self.log("❌ No documents to embed")
            return None
        
        # Create directory for vector store if it doesn't exist
        os.makedirs(store_path, exist_ok=True)
        
        # Check if vector store already exists and force_rebuild is not set
        if not force_rebuild and os.path.exists(store_path) and any(os.listdir(store_path)):
            try:
                self.log(f"📂 Loading existing vector store from {store_path}")
                embeddings = HuggingFaceEmbeddings(model_name=embedding_model)
                # Add allow_dangerous_deserialization=True to fix the pickle security error
                db = FAISS.load_local(store_path, embeddings, allow_dangerous_deserialization=True)
                self.vector_store = db
                return db
            except Exception as e:
                self.log(f"❌ Error loading vector store: {str(e)}")
                self.log("Creating new vector store...")
        
        try:
            # Initialize the HuggingFace embeddings model
            self.log(f"🔄 Creating embeddings with model: {embedding_model}")
            embeddings = HuggingFaceEmbeddings(model_name=embedding_model)
            
            # Create a FAISS vector store from the documents
            start_time = time.time()
            db = FAISS.from_documents(documents=docs, embedding=embeddings)
            end_time = time.time()
            
            self.log(f"✅ Created vector store with {len(docs)} documents in {end_time - start_time:.2f} seconds")
            
            # Save the vector store
            self.log(f"💾 Saving vector store to {store_path}")
            db.save_local(store_path)
            
            self.vector_store = db
            return db
        except Exception as e:
            self.log(f"❌ Error creating vector store: {str(e)}")
            return None
    
    def initialize_llm(self, model_name: Optional[str] = None) -> ChatGoogleGenerativeAI:
        """
        Initialize the LLM with optimized settings.
        
        Args:
            model_name: Name of the LLM model (overrides the one set during initialization)
            
        Returns:
            Initialized LLM
        """
        model_name = model_name or self.model_name
        
        try:
            # Initialize Google's Gemini model with custom parameters
            llm = ChatGoogleGenerativeAI(
                model=model_name,
                temperature=0.2,  # Lower temperature for more factual responses
                top_p=0.95,
                top_k=40,
                max_output_tokens=8096,
                cache=True,  # Enable response caching
            )
            self.log(f"✅ Initialized {model_name} LLM")
            
            self.llm = llm
            return llm
        except Exception as e:
            self.log(f"❌ Error initializing LLM: {str(e)}")
            raise RuntimeError(f"Failed to initialize LLM: {str(e)}")
    
    def create_prompt_template(self, custom_template: Optional[str] = None) -> ChatPromptTemplate:
        """
        Create an optimized prompt template for RAG that handles page number references.
        
        Args:
            custom_template: Custom prompt template to use instead of the default
            
        Returns:
            Prompt template
        """
        if custom_template:
            return ChatPromptTemplate.from_template(custom_template)
        
        default_template = """You are a helpful assistant that provides accurate information based on the provided context.

        You are a very nice chat bot. And understand nicely what the user is asking.
        you answer the query in detail but does not give anything which is irrelevant.

        when user ask question you follow this:
        Answer the following question step by step, citing information and the data from the context.
        At the end, include the source page number in the format: "Source: page-numbers of the documents u got as context"
        if you are asked for giving any kind of data from the document then you have to give data in json format which can be converted in csv format and can be used for further analysis.
        
        The context includes page number information in the format [Page: X]. Use these annotations to cite your sources.
        
        Keep your answer clearly formatted.
        In case you do not get context then answer question in a friendly manner based on question only and you should act like a very nice chat bot. 
        VERY IMPORTANT: you have to give answer in markdown format which can be seen in a better way.

        <context>
        {context}
        </context>

        Question: {input}"""

        return ChatPromptTemplate.from_template(default_template)
    
    def create_rag_chain(self, 
                       db: Optional[FAISS] = None, 
                       llm: Optional[ChatGoogleGenerativeAI] = None,
                       custom_prompt: Optional[str] = None,
                       k: int = 10) -> Any:
        """
        Create optimized RAG chain with customized retriever.
        
        Args:
            db: Vector store (uses self.vector_store if None)
            llm: LLM model (uses self.llm if None)
            custom_prompt: Custom prompt template
            k: Number of documents to retrieve
            
        Returns:
            RAG chain
        """
        db = db or self.vector_store
        llm = llm or self.llm
        
        if not db or not llm:
            self.log("❌ Missing vector store or LLM")
            return None
        
        # Create optimized prompt
        prompt = self.create_prompt_template(custom_prompt)
        
        # Create the document chain with output parsing
        document_chain = create_stuff_documents_chain(llm, prompt)
        
        # Configure the retriever with search parameters
        retriever = db.as_retriever(
            search_type="similarity",  # Options: similarity, mmr
            search_kwargs={
                "k": k,  # Retrieve top k most relevant documents
            }
        )
        
        # Create the retrieval chain
        chain = create_retrieval_chain(retriever, document_chain)
        self.chain = chain
        return chain
    
    def query(self, query_text: str) -> Dict[str, Any]:
        """
        Execute a query against the RAG system with timing and error handling.
        
        Args:
            query_text: Query text to execute
            
        Returns:
            Dictionary containing the answer
        """
        if not self.chain:
            error_message = "**System not properly initialized.**\n\nPlease call setup() first or initialize components individually."
            console.print(Markdown(error_message))  # Render Markdown in CLI
            return {"answer": error_message}
        
        try:
            self.log(f"🔍 Executing query: {query_text}")
            start_time = time.time()
            result = self.chain.invoke({"input": query_text})
            end_time = time.time()

            self.log(f"✅ Query executed successfully in {end_time - start_time:.2f} seconds")
            
            return result
        
        except Exception as e:
            error_message = f"❌ **An error occurred:**\n\n```\n{str(e)}\n```"
            console.print(Markdown(error_message))  # Render Markdown in CLI
            return {"answer": error_message}
    
    def setup(self, json_path: Optional[str] = None, force_rebuild: bool = False) -> bool:
        """
        Convenience method to set up the entire RAG system in one go.
        
        Args:
            json_path: Path to JSON data file (overrides the one set during initialization)
            force_rebuild: Whether to force rebuilding the vector store
            
        Returns:
            True if setup was successful, False otherwise
        """
        try:
            # Load documents
            self.load_documents(json_path)
            
            # Split documents
            self.split_documents()
            
            # Initialize vector store
            self.initialize_vector_store(force_rebuild=force_rebuild)
            
            # Initialize LLM
            self.initialize_llm()
            
            # Create RAG chain
            self.create_rag_chain()
            
            self.log("✅ RAG system setup complete")
            return True
        
        except Exception as e:
            self.log(f"❌ Error during setup: {str(e)}")
            return False

# Example usage (commented out)
"""
# Quick setup and query
def main():
    rag = RAGSystem()
    rag.setup()
    result = rag.query("What are the key findings in the document?")
    console.print(Markdown(result["answer"]))

if __name__ == "__main__":
    main()
"""