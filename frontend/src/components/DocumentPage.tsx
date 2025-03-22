import React from 'react';
import { useParams } from 'react-router-dom';
import { Container, Paper, Typography } from '@mui/material';
import DocumentTablesViewer from './DocumentTablesViewer';

const DocumentPage: React.FC = () => {
  // Get document ID from URL params
  const { id } = useParams<{ id: string }>();
  const documentId = id || ''; // No parseInt conversion
  
  if (!documentId) {
    return (
      <Container>
        <Paper sx={{ p: 3, mt: 3 }}>
          <Typography color="error">Invalid document ID</Typography>
        </Paper>
      </Container>
    );
  }

  return (
    <Container maxWidth="lg">
      <Paper sx={{ p: 3, mt: 3 }}>
        <Typography variant="h4" gutterBottom>
          Document Details
        </Typography>
        <DocumentTablesViewer documentId={documentId} />
      </Paper>
    </Container>
  );
};

export default DocumentPage;