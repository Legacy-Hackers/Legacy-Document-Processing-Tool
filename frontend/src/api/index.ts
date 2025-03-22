import axios from 'axios';

// Create an instance of axios with default config
const api = axios.create({
  baseURL: 'http://localhost:5001',
  headers: {
    'Content-Type': 'application/json',
  }
});

// Types
export interface DocumentMention {
  id: string;
  name: string;
  type: string;
}

export interface DocumentSuggestion {
  id: string;
  name: string;
  type: string;
  preview?: string;
}

export interface QueryResponse {
  success: boolean;
  response?: string;
  error?: string;
}

// API functions
export const getDocumentSuggestions = async (query: string): Promise<DocumentSuggestion[]> => {
  try {
    const response = await api.get('/api/documents/suggestions', {
      params: { query }
    });
    console.log('Document suggestions response:', response.data);
    return response.data;
  } catch (error) {
    console.error('Error fetching document suggestions:', error);
    return [];
  }
};

export const executeQuery = async (
  query: string, 
  mentions: DocumentMention[] = [],
  mode: string = 'Chat'
): Promise<QueryResponse> => {
  try {
    // Ensure we're sending the complete mentions data including tableReferences
    const response = await api.post('/api/query', {
      query,
      mentions: mentions,
      mode
    });
    return {
      success: true,
      response: response.data.answer || response.data.response
    };
  } catch (error: any) {
    console.error('Error executing query:', error);
    // Get the error message from the backend response if available
    const errorMessage = error.response?.data?.error || 'Failed to execute query. Please try again.';
    return {
      success: false,
      error: errorMessage
    };
  }
};

export default api; 