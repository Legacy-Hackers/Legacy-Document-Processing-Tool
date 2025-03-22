import React, { useState, useRef, useCallback } from 'react';
import { 
  Box, 
  Typography, 
  Paper, 
  Button, 
  CircularProgress, 
  Alert, 
  Snackbar,
  LinearProgress,
  Stack
} from '@mui/material';
import CloudUploadIcon from '@mui/icons-material/CloudUpload';
import DescriptionIcon from '@mui/icons-material/Description';
import CheckCircleIcon from '@mui/icons-material/CheckCircle';
import CancelIcon from '@mui/icons-material/Cancel';
import { useNavigate } from 'react-router-dom';
import { uploadDocument } from "../../api/documents";

const UploadFilePage: React.FC = () => {
  const [file, setFile] = useState<File | null>(null);
  const [isDragging, setIsDragging] = useState(false);
  const [uploading, setUploading] = useState(false);
  const [progress, setProgress] = useState(0);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState(false);
  const fileInputRef = useRef<HTMLInputElement>(null);
  const navigate = useNavigate();
  
  // Simulate progress updates during processing
  const simulateProgress = useCallback(() => {
    // Reset progress
    setProgress(0);
    
    // Simulate file upload progress (0-50%)
    const uploadInterval = setInterval(() => {
      setProgress(prev => {
        if (prev < 50) return prev + 1;
        clearInterval(uploadInterval);
        return 50;
      });
    }, 50);
    
    // After reaching 50%, simulate processing progress (50-100%)
    setTimeout(() => {
      const processInterval = setInterval(() => {
        setProgress(prev => {
          if (prev < 95) return prev + 1;
          clearInterval(processInterval);
          return 95;
        });
      }, 200);
    }, 2500);
  }, []);
  
  const handleDragEnter = (e: React.DragEvent<HTMLDivElement>) => {
    e.preventDefault();
    e.stopPropagation();
    setIsDragging(true);
  };
  
  const handleDragLeave = (e: React.DragEvent<HTMLDivElement>) => {
    e.preventDefault();
    e.stopPropagation();
    setIsDragging(false);
  };
  
  const handleDragOver = (e: React.DragEvent<HTMLDivElement>) => {
    e.preventDefault();
    e.stopPropagation();
  };
  
  const handleDrop = (e: React.DragEvent<HTMLDivElement>) => {
    e.preventDefault();
    e.stopPropagation();
    setIsDragging(false);
    
    if (e.dataTransfer.files && e.dataTransfer.files.length > 0) {
      const droppedFile = e.dataTransfer.files[0];
      validateAndSetFile(droppedFile);
    }
  };
  
  const validateAndSetFile = (file: File) => {
    // Check if file is a PDF
    if (file.type !== 'application/pdf') {
      setError('Only PDF files are accepted');
      return;
    }
    
    // Check file size (limit to 50MB)
    if (file.size > 50 * 1024 * 1024) {
      setError('File size exceeds 50MB limit');
      return;
    }
    
    setFile(file);
    setError(null);
  };
  
  const handleFileSelect = () => {
    fileInputRef.current?.click();
  };
  
  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files && e.target.files.length > 0) {
      validateAndSetFile(e.target.files[0]);
    }
  };
  
  const handleUpload = async () => {
    if (!file) return;
    
    try {
      setUploading(true);
      setError(null);
      simulateProgress();
      
      const result = await uploadDocument(file);
      
      // Complete the progress
      setProgress(100);
      
      // Show success
      setSuccess(true);
      
      // Reset the form
      setTimeout(() => {
        setFile(null);
        setUploading(false);
        // Navigate to documents list page or stay on the current page
        // navigate('/documents');
      }, 2000);
      
    } catch (err) {
      setUploading(false);
      setProgress(0);
      setError(err instanceof Error ? err.message : 'An error occurred during upload');
    }
  };
  
  const handleCancel = () => {
    setFile(null);
    setUploading(false);
    setProgress(0);
    setError(null);
  };

  return (
    <Box sx={{ maxWidth: 800, mx: 'auto', p: 4 }}>
      <Typography variant="h4" component="h1" gutterBottom>
        Upload Document
      </Typography>
      
      <Typography variant="body1" color="text.secondary" paragraph>
        Upload PDF files for automated content extraction and analysis.
        The system will extract text, tables, and images from your documents.
      </Typography>
      
      <Paper
        sx={{
          p: 6,
          mt: 4,
          mb: 4,
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
          justifyContent: 'center',
          border: isDragging ? '2px dashed #2196f3' : '2px dashed #ccc',
          borderRadius: 2,
          backgroundColor: isDragging ? 'rgba(33, 150, 243, 0.04)' : 'background.paper',
          cursor: 'pointer',
          transition: 'all 0.3s ease'
        }}
        onDragEnter={handleDragEnter}
        onDragLeave={handleDragLeave}
        onDragOver={handleDragOver}
        onDrop={handleDrop}
        onClick={handleFileSelect}
      >
        <input
          type="file"
          ref={fileInputRef}
          style={{ display: 'none' }}
          accept=".pdf"
          onChange={handleFileChange}
          disabled={uploading}
        />
        
        {file ? (
          <Box sx={{ textAlign: 'center' }}>
            <DescriptionIcon sx={{ fontSize: 60, color: 'primary.main', mb: 2 }} />
            <Typography variant="body1" sx={{ fontWeight: 'bold' }}>
              {file.name}
            </Typography>
            <Typography variant="body2" color="text.secondary">
              {(file.size / (1024 * 1024)).toFixed(2)} MB
            </Typography>
          </Box>
        ) : (
          <Box sx={{ textAlign: 'center' }}>
            <CloudUploadIcon sx={{ fontSize: 60, color: 'text.secondary', mb: 2 }} />
            <Typography variant="h6">
              Drag & Drop or Click to Upload
            </Typography>
            <Typography variant="body2" color="text.secondary">
              Supported format: PDF
            </Typography>
          </Box>
        )}
      </Paper>
      
      {file && (
        <Stack direction="row" spacing={2} justifyContent="center" mt={2}>
          <Button
            variant="contained"
            color="primary"
            size="large"
            startIcon={uploading ? <CircularProgress size={20} color="inherit" /> : <CloudUploadIcon />}
            onClick={handleUpload}
            disabled={uploading || !file}
            sx={{ minWidth: 150 }}
          >
            {uploading ? 'Processing...' : 'Upload'}
          </Button>
          
          <Button
            variant="outlined"
            color="error"
            size="large"
            startIcon={<CancelIcon />}
            onClick={handleCancel}
            disabled={uploading}
            sx={{ minWidth: 150 }}
          >
            Cancel
          </Button>
        </Stack>
      )}
      
      {uploading && (
        <Box sx={{ width: '100%', mt: 4 }}>
          <Typography variant="body2" color="text.secondary" sx={{ mb: 1 }}>
            {progress < 50 
              ? 'Uploading file...' 
              : progress < 95 
                ? 'Extracting content...' 
                : progress < 100 
                  ? 'Finalizing...' 
                  : 'Completed!'}
            {' '}{progress}%
          </Typography>
          <LinearProgress 
            variant="determinate" 
            value={progress} 
            sx={{ 
              height: 10, 
              borderRadius: 5,
              '& .MuiLinearProgress-bar': {
                backgroundColor: progress === 100 ? 'success.main' : 'primary.main',
              }
            }} 
          />
        </Box>
      )}
      
      <Snackbar 
        open={!!error} 
        autoHideDuration={6000} 
        onClose={() => setError(null)}
        anchorOrigin={{ vertical: 'bottom', horizontal: 'center' }}
      >
        <Alert severity="error" onClose={() => setError(null)}>
          {error}
        </Alert>
      </Snackbar>
      
      <Snackbar
        open={success}
        autoHideDuration={6000}
        onClose={() => setSuccess(false)}
        anchorOrigin={{ vertical: 'bottom', horizontal: 'center' }}
      >
        <Alert 
          severity="success" 
          icon={<CheckCircleIcon fontSize="inherit" />}
          onClose={() => setSuccess(false)}
        >
          Document processed successfully!
        </Alert>
      </Snackbar>
    </Box>
  );
};

export default UploadFilePage;