import React, { useEffect, useState } from 'react';
import { Box, Typography, CircularProgress, Divider, Pagination, Button } from '@mui/material';
import MarkdownRenderer from './MarkdownRenderer';
import { getDocumentTables } from '../api/documents';
import { height } from '@mui/system';

interface TableData {
  page_number: number;
  markdown_content: string;
  file_name: string;
}

interface DocumentTablesViewerProps {
  documentId: string;
}

const DocumentTablesViewer: React.FC<DocumentTablesViewerProps> = ({ documentId }) => {
  const [tables, setTables] = useState<TableData[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);
  const [currentPage, setCurrentPage] = useState<number>(1);

  const fetchDocumentTables = async () => {
    try {
      setLoading(true);
      setError(null);
      console.log(`Fetching tables for document ID: ${documentId}`);
      
      const result = await getDocumentTables(documentId);
      
      // Check if the response is an error object
      if (!Array.isArray(result) && 'error' in result) {
        throw new Error(result.error || 'Failed to load tables');
      }
      
      // At this point we know result is an array of TableData
      const tableData = result as TableData[];
      console.log(`Successfully fetched ${tableData.length} tables`);
      setTables(tableData);
    } catch (err) {
      console.error('Error fetching document tables:', err);
      setError(err instanceof Error ? err.message : 'An unknown error occurred');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    if (documentId) {
      fetchDocumentTables();
    }
  }, [documentId]);

  // Get current table data based on pagination
  const currentTableData = tables.length > 0 ? 
    tables.find(table => table.page_number === currentPage) : null;

  // Handle page change
  const handlePageChange = (event: React.ChangeEvent<unknown>, value: number) => {
    setCurrentPage(value);
  };

  // Retry loading tables
  const handleRetry = () => {
    fetchDocumentTables();
  };

  if (loading) {
    return (
      <Box sx={{ display: 'flex', justifyContent: 'center', p: 3 }}>
        <CircularProgress />
      </Box>
    );
  }

  if (error) {
    return (
      <Box sx={{ p: 3, color: 'error.main' }}>
        <Typography variant="h6">Error</Typography>
        <Typography sx={{ mb: 2 }}>{error}</Typography>
        <Button 
          variant="contained" 
          color="primary" 
          onClick={handleRetry}
          sx={{ mt: 1 }}
        >
          Retry
        </Button>
      </Box>
    );
  }

  if (tables.length === 0) {
    return (
      <Box sx={{ p: 3 }}>
        <Typography>No tables found for this document.</Typography>
        <Button 
          variant="contained" 
          color="primary" 
          onClick={handleRetry}
          sx={{ mt: 2 }}
        >
          Retry
        </Button>
      </Box>
    );
  }

  return (
    <Box sx={{ p: 2 }}>
      <Typography variant="h5" gutterBottom>
        Document Tables
      </Typography>
      
      <Divider sx={{ my: 2 }} />
      
      {currentTableData ? (
        <Box sx={{ mb: 3 }}>
          <Typography variant="subtitle1" gutterBottom>
            Page {currentTableData.page_number}
          </Typography>
          <Box sx={{ 
            bgcolor: 'background.paper', 
            p: 2, 
            borderRadius: 1, 
            boxShadow: 1, 
            height: '400px', 
            overflowY: 'auto',
            overflowX: 'auto' 
          }}>
            <MarkdownRenderer markdown={currentTableData.markdown_content} />
          </Box>
        </Box>
      ) : (
        <Typography>Select a page to view tables</Typography>
      )}
      
      <Box sx={{ display: 'flex', justifyContent: 'center', mt: 3 }}>
        <Pagination 
          count={tables.length} 
          page={currentPage}
          onChange={handlePageChange}
          color="primary"
          showFirstButton
          showLastButton
        />
      </Box>
    </Box>
  );
};

export default DocumentTablesViewer;
