import React, { useEffect, useState } from 'react';
import { 
  Box, 
  Typography, 
  Card, 
  CardContent, 
  CardActions, 
  Button, 
  Grid, 
  CircularProgress,
  Divider,
  Paper,
  Alert,
  Snackbar,
  alpha,
  IconButton,
  Tooltip,
  useTheme
} from '@mui/material';
import DeleteIcon from '@mui/icons-material/Delete';
import CloudDownloadIcon from '@mui/icons-material/CloudDownload';
import TableChartIcon from '@mui/icons-material/TableChart';
import FolderIcon from '@mui/icons-material/Folder';
import { motion } from 'framer-motion';
import { useNavigate } from 'react-router-dom';
import { Document, getAllDocuments, deleteDocument, downloadDocument } from '../../api/documents';

const MyDocuments: React.FC = () => {
  const [documents, setDocuments] = useState<Document[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [successMessage, setSuccessMessage] = useState<string | null>(null);
  const theme = useTheme();
  const navigate = useNavigate();

  // Load documents on component mount
  useEffect(() => {
    loadDocuments();
  }, []);

  const loadDocuments = async () => {
    try {
      setLoading(true);
      setError(null);
      const docs = await getAllDocuments();
      console.log('Documents from API:', docs); // Debug API response
      setDocuments(docs);
    } catch (err) {
      // setError('Failed to load documents. Please try again.');
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  const handleDownload = async (doc: Document) => {
    try {
      await downloadDocument(doc.file_path, getOriginalName(doc.filename));
    } catch (err) {
      console.error('Download failed:', err);
      setError('Failed to download document. Please try again.');
    }
  };

  const handleDelete = async (docId: string) => {
    if (!window.confirm('Are you sure you want to delete this document? This will remove all extracted data.')) {
      return;
    }
    
    try {
      console.log('Deleting document with ID:', docId); // Debug deletion ID
      await deleteDocument(docId);
      // Update the documents list after successful deletion
      setDocuments(prevDocs => prevDocs.filter(d => d.id !== docId));
      // Show success message
      setSuccessMessage('Document successfully deleted');
      // Clear error if any
      setError(null);
    } catch (err) {
      console.error('Delete failed:', err);
      setError('Failed to delete document. Please try again.');
    }
  };

  // Handle success message close
  const handleSuccessClose = () => {
    setSuccessMessage(null);
  };

  // Extract original filename without timestamp prefix
  const getOriginalName = (filename: string) => {
    const parts = filename.split('_');
    return parts.length > 1 ? parts.slice(1).join('_') : filename;
  };

  // Helper to determine if a document is processed
  const isProcessed = (doc: Document) => {
    // If processed is a boolean, use it directly
    if (typeof doc.processed === 'boolean') {
      return doc.processed;
    } 
    // If somehow processed is a string (from API serialization), handle it
    // Using type assertion to avoid TypeScript error
    else if (typeof (doc.processed as any) === 'string') {
      return (doc.processed as string).toLowerCase() === 'true';
    } 
    // Fallback: check for processing errors
    else {
      return doc.processing_error === null || doc.processing_error === undefined;
    }
  };

  if (loading) {
    return (
      <Box sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '50vh' }}>
        <CircularProgress />
      </Box>
    );
  }

  return (
    <Box sx={{ width: '100%', p: 2 }}>
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5 }}
      >
        <Paper 
          elevation={0}
          sx={{ 
            p: 3, 
            mb: 4, 
            borderRadius: '12px',
            background: `linear-gradient(135deg, ${alpha(theme.palette.primary.main, 0.08)} 0%, ${alpha(theme.palette.primary.main, 0.02)} 100%)`,
          }}
        >
          <Typography variant="h4" component="h1" sx={{ fontWeight: 600, mb: 1 }}>
            My Documents
          </Typography>
          <Typography variant="body1" color="text.secondary">
            Browse and manage your uploaded documents and their extracted data.
          </Typography>
        </Paper>
      </motion.div>

      {/* Error message */}
      {error && (
        <Alert severity="error" sx={{ mb: 3 }}>
          {error}
        </Alert>
      )}

      {/* Success message snackbar */}
      <Snackbar
        open={!!successMessage}
        autoHideDuration={6000}
        onClose={handleSuccessClose}
        anchorOrigin={{ vertical: 'top', horizontal: 'center' }}
      >
        <Alert onClose={handleSuccessClose} severity="success" sx={{ width: '100%' }}>
          {successMessage}
        </Alert>
      </Snackbar>

      {documents.length === 0 && !loading ? (
        <Paper sx={{ p: 4, textAlign: 'center', borderRadius: '12px' }}>
          <FolderIcon sx={{ fontSize: 60, color: 'text.disabled', mb: 2 }} />
          <Typography variant="h6" gutterBottom>
            No Documents Found
          </Typography>
          <Typography variant="body2" color="text.secondary" sx={{ mb: 3 }}>
            Upload a document to get started with extraction and analysis.
          </Typography>
          <Button 
            variant="contained" 
            onClick={() => navigate('/upload')}
            sx={{ mt: 2 }}
          >
            Upload Document
          </Button>
        </Paper>
      ) : (
        <Grid container spacing={3}>
          {documents.map((doc) => (
            <Grid item xs={12} sm={6} md={4} key={doc.id}>
              <motion.div
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ duration: 0.3 }}
              >
                <Card sx={{ 
                  height: '100%', 
                  display: 'flex', 
                  flexDirection: 'column',
                  borderRadius: '12px',
                  transition: 'all 0.3s ease',
                  '&:hover': {
                    boxShadow: `0 8px 24px ${alpha(theme.palette.primary.main, 0.15)}`,
                    transform: 'translateY(-4px)'
                  }
                }}>
                  <CardContent sx={{ flexGrow: 1 }}>
                    <Typography variant="h6" component="h2" gutterBottom noWrap title={getOriginalName(doc.filename)}>
                      {getOriginalName(doc.filename)}
                    </Typography>
                    <Typography variant="body2" color="text.secondary" gutterBottom>
                      Uploaded: {new Date(doc.upload_date).toLocaleDateString()}
                    </Typography>
                    {doc.file_size && (
                      <Typography variant="body2" color="text.secondary">
                        Size: {doc.file_size}
                      </Typography>
                    )}
                    <Typography 
                      variant="body2" 
                      sx={{ 
                        mt: 2, 
                        fontWeight: 500, 
                        color: isProcessed(doc) ? 'success.main' : 'warning.main'
                      }}
                    >
                      Status: {isProcessed(doc) ? 'Processed' : 'Processing...'}
                    </Typography>
                  </CardContent>
                  
                  <Divider />
                  
                  <CardActions sx={{ p: 2, justifyContent: 'space-between' }}>
                    <Box>
                      <Tooltip title="Download PDF">
                        <IconButton 
                          size="small" 
                          color="primary" 
                          onClick={() => handleDownload(doc)} 
                          sx={{ mr: 1 }}
                        >
                          <CloudDownloadIcon />
                        </IconButton>
                      </Tooltip>
                      
                      <Tooltip title="View Tables (Coming Soon)">
                        <IconButton 
                          size="small" 
                          color="primary"
                          onClick={() => navigate(`/documents/${doc.id}`)}
                        >
                          <TableChartIcon />
                        </IconButton>
                      </Tooltip>
                    </Box>
                    
                    <Tooltip title="Delete Document">
                      <IconButton 
                        size="small" 
                        color="error" 
                        onClick={() => handleDelete(doc.id)}
                      >
                        <DeleteIcon />
                      </IconButton>
                    </Tooltip>
                  </CardActions>
                </Card>
              </motion.div>
            </Grid>
          ))}
        </Grid>
      )}
    </Box>
  );
};

export default MyDocuments; 