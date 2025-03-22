// QueryPageChat.tsx
import React, { useState, useEffect, useRef, useCallback } from 'react';
import {
  Box,
  Paper,
  Typography,
  TextField,
  IconButton,
  CircularProgress,
  Alert,
  useTheme,
  Tooltip,
  Avatar,
  Popper,
  List,
  ListItem,
  ListItemButton,
  ListItemText,
  ClickAwayListener,
  Menu,
  MenuItem,
  alpha,
  Chip,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  Button,
  Badge,
  Grow,
  ListItemIcon
} from '@mui/material';
import SendIcon from '@mui/icons-material/Send';
import MicIcon from '@mui/icons-material/Mic';
import SmartToyIcon from '@mui/icons-material/SmartToy';
import PersonIcon from '@mui/icons-material/Person';
import DescriptionIcon from '@mui/icons-material/Description';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import BarChartIcon from '@mui/icons-material/BarChart';
import ChatIcon from '@mui/icons-material/Chat';
import CloseIcon from '@mui/icons-material/Close';
import AddIcon from '@mui/icons-material/Add';
import DeleteIcon from '@mui/icons-material/Delete';
import TableChartIcon from '@mui/icons-material/TableChart';
import ReactMarkdown from 'react-markdown';
import remarkGfm from 'remark-gfm';
import { executeQuery as apiExecuteQuery, DocumentMention, DocumentSuggestion, getDocumentSuggestions } from '../../api';
import { debounce } from 'lodash';
import './QueryTool.css';

// Voice query function (stub for now)
const startVoiceQuery = async (): Promise<any> => {
  console.log('Voice query not implemented');
  return { success: false, error: 'Voice query not implemented' };
};

// Define TableReference interface
interface TableReference {
  pageNumber: string;
  tableNumber: string;
}

// Define DocumentMentionWithTables interface that extends DocumentMention
interface DocumentMentionWithTables extends DocumentMention {
  id: string;  // explicitly include id
  name: string; // explicitly include name
  type: string; // explicitly include type
  tableReferences?: TableReference[];
}

// Define ChatMessage interface
interface ChatMessage {
  role: 'user' | 'assistant';
  content: string;
  mentions?: DocumentMentionWithTables[];
}

// Document Chips Component
interface DocumentChipsProps {
  documents: DocumentMentionWithTables[];
  onRemove: (docId: string) => void;
  selectedMode: string;
}

const DocumentChips: React.FC<DocumentChipsProps> = ({ documents, onRemove, selectedMode }) => {
  const theme = useTheme();
  
  if (documents.length === 0) return null;
  
  return (
    <Box 
      className="document-chips"
      role="region"
      aria-label="Selected documents"
      sx={{ 
        backgroundColor: alpha(theme.palette.background.default, 0.6)
      }}
    >
      {documents.map((doc) => (
        <Chip
          key={doc.id}
          label={
            <Box sx={{ display: 'flex', alignItems: 'center', gap: 0.7 }}>
              {doc.name}
              {selectedMode === 'Analytics' && doc.tableReferences && doc.tableReferences.length > 0 && (
                <Badge
                  badgeContent={doc.tableReferences.length}
                  color="primary"
                  sx={{ ml: 1 }}
                >
                  <TableChartIcon fontSize="small" />
                </Badge>
              )}
            </Box>
          }
          variant="outlined"
          size="small"
          icon={<DescriptionIcon />}
          onDelete={() => onRemove(doc.id)}
          deleteIcon={<CloseIcon fontSize="small" />}
          aria-label={`Referenced document: ${doc.name}${doc.tableReferences?.length ? ` with ${doc.tableReferences.length} table references` : ''}. Press delete or backspace to remove.`}
          sx={{
            color: theme.palette.primary.main,
            borderColor: theme.palette.primary.main,
            backgroundColor: alpha(theme.palette.primary.main, 0.08),
            '& .MuiChip-deleteIcon': {
              color: theme.palette.primary.main,
              '&:hover': {
                color: theme.palette.primary.dark,
              }
            },
            '& .MuiChip-icon': {
              color: theme.palette.primary.main,
            },
            boxShadow: `0 1px 2px ${alpha(theme.palette.common.black, 0.1)}`
          }}
        />
      ))}
    </Box>
  );
};

// Message Bubble Component
interface MessageBubbleProps {
  message: ChatMessage;
}

const MessageBubble: React.FC<MessageBubbleProps> = ({ message }) => {
  const theme = useTheme();
  const isUser = message.role === 'user';
  
  return (
    <Box
      sx={{
        display: 'flex',
        mb: 3,
        alignItems: 'flex-start',
        justifyContent: isUser ? 'flex-end' : 'flex-start',
      }}
    >
      {!isUser && (
        <Avatar 
          sx={{ 
            bgcolor: theme.palette.primary.main,
            mr: 1,
            width: 36,
            height: 36
          }}
          aria-label="Assistant"
        >
          <SmartToyIcon />
        </Avatar>
      )}
      
      <Box
        sx={{ 
          maxWidth: 'calc(100% - 50px)',
          width: 'auto',
        }}
      >
        <Typography 
          variant="body2" 
          sx={{ 
            fontWeight: 'bold', 
            mb: 0.5,
            color: isUser ? theme.palette.grey[700] : theme.palette.primary.main,
            textAlign: isUser ? 'right' : 'left',
          }}
        >
          {isUser ? 'You' : 'Assistant'}
        </Typography>
        <Paper
          elevation={0}
          sx={{
            p: 1.5,
            bgcolor: isUser 
              ? theme.palette.mode === 'dark' 
                ? alpha(theme.palette.primary.main, 0.15)
                : alpha(theme.palette.primary.main, 0.08)
              : theme.palette.background.default,
            borderRadius: 1,
            border: isUser 
              ? `1px solid ${alpha(theme.palette.primary.main, 0.2)}`
              : 'none',
            '& .markdown-content': {
              '& img': {
                maxWidth: '100%',
                height: 'auto'
              },
              '& a': {
                color: theme.palette.primary.main,
                textDecoration: 'none',
                '&:hover': {
                  textDecoration: 'underline'
                }
              },
              '& code': {
                backgroundColor: alpha(theme.palette.grey[400], 0.2),
                padding: '2px 4px',
                borderRadius: '4px',
                fontFamily: 'monospace',
                fontSize: '0.9em'
              },
              '& pre': {
                backgroundColor: alpha(theme.palette.grey[400], 0.2),
                padding: '8px 12px',
                borderRadius: '4px',
                overflowX: 'auto',
                '& code': {
                  backgroundColor: 'transparent',
                  padding: 0
                }
              },
              '& table': {
                borderCollapse: 'collapse',
                width: '100%',
                margin: '16px 0',
                '& th, & td': {
                  border: `1px solid ${theme.palette.divider}`,
                  padding: '8px',
                  textAlign: 'left'
                },
                '& th': {
                  backgroundColor: alpha(theme.palette.primary.main, 0.08)
                }
              },
              '& h1, & h2, & h3, & h4, & h5, & h6': {
                marginTop: '1.5em',
                marginBottom: '0.5em',
                fontWeight: 600
              },
              '& h1': {
                fontSize: '1.7em'
              },
              '& h2': {
                fontSize: '1.5em'
              },
              '& h3': {
                fontSize: '1.3em'
              },
              '& p': {
                marginTop: '0.8em',
                marginBottom: '0.8em'
              },
              '& ul, & ol': {
                paddingLeft: '1.5em',
                marginTop: '0.8em',
                marginBottom: '0.8em'
              },
              '& li': {
                marginBottom: '0.3em'
              },
              '& blockquote': {
                borderLeft: `4px solid ${alpha(theme.palette.primary.main, 0.3)}`,
                paddingLeft: '1em',
                marginLeft: 0,
                marginRight: 0,
                fontStyle: 'italic',
                color: theme.palette.text.secondary
              },
              '& hr': {
                border: 'none',
                borderBottom: `1px solid ${theme.palette.divider}`,
                margin: '1.5em 0'
              }
            }
          }}
        >
          {isUser ? (
            <Typography variant="body1" sx={{ wordBreak: 'break-word' }}>
              {message.content}
            </Typography>
          ) : (
            <div className="markdown-content">
              <ReactMarkdown remarkPlugins={[remarkGfm]}>
                {message.content}
              </ReactMarkdown>
            </div>
          )}
        </Paper>
      </Box>

      {isUser && (
        <Avatar 
          sx={{ 
            bgcolor: theme.palette.primary.main,
            ml: 1,
            width: 36,
            height: 36
          }}
          aria-label="You"
        >
          <PersonIcon />
        </Avatar>
      )}
    </Box>
  );
};

// Mode Selector Component
interface ModeSelectorProps {
  selectedMode: string;
  onModeSelect: (mode: string) => void;
}

const ModeSelector: React.FC<ModeSelectorProps> = ({ selectedMode, onModeSelect }) => {
  const [modeAnchorEl, setModeAnchorEl] = useState<null | HTMLElement>(null);
  const theme = useTheme();
  
  const handleModeClick = (event: React.MouseEvent<HTMLElement>) => {
    setModeAnchorEl(event.currentTarget);
  };
  
  const handleModeClose = () => {
    setModeAnchorEl(null);
  };
  
  const handleModeSelect = (mode: string) => {
    onModeSelect(mode);
    handleModeClose();
  };

  const modeIcons: { [key: string]: React.ReactNode } = {
    'Chat': <ChatIcon fontSize="small" />,
    'Analytics': <BarChartIcon fontSize="small" />
  };
  
  return (
    <>
      <Tooltip title="Change Mode">
        <IconButton
          className="mode-button"
          onClick={handleModeClick}
          aria-haspopup="true"
          aria-controls="mode-menu"
          size="small"
          color="primary"
          sx={{
            backgroundColor: alpha(theme.palette.primary.main, 0.05),
            '&:hover': {
              backgroundColor: alpha(theme.palette.primary.main, 0.1)
            }
          }}
        >
          {modeIcons[selectedMode]}
        </IconButton>
      </Tooltip>

      <Menu
        id="mode-menu"
        anchorEl={modeAnchorEl}
        open={Boolean(modeAnchorEl)}
        onClose={handleModeClose}
        anchorOrigin={{
          vertical: 'top',
          horizontal: 'center',
        }}
        transformOrigin={{
          vertical: 'bottom',
          horizontal: 'center',
        }}
      >
        <MenuItem 
          onClick={() => handleModeSelect('Chat')} 
          selected={selectedMode === 'Chat'}
          sx={{ minWidth: '180px' }}
        >
          <ListItemIcon>
            <ChatIcon fontSize="small" />
          </ListItemIcon>
          <ListItemText>
            Chat Mode
            <Typography variant="body2" color="text.secondary" sx={{ mt: 0.5 }}>
              Ask questions about your documents
            </Typography>
          </ListItemText>
        </MenuItem>
        <MenuItem 
          onClick={() => handleModeSelect('Analytics')} 
          selected={selectedMode === 'Analytics'}
          sx={{ minWidth: '180px' }}
        >
          <ListItemIcon>
            <BarChartIcon fontSize="small" />
          </ListItemIcon>
          <ListItemText>
            Analytics Mode
            <Typography variant="body2" color="text.secondary" sx={{ mt: 0.5 }}>
              Query tables from your documents
            </Typography>
          </ListItemText>
        </MenuItem>
      </Menu>
    </>
  );
};

// Document Suggestion List Component
interface DocumentSuggestionListProps {
  isOpen: boolean;
  anchorEl: HTMLElement | null;
  documents: DocumentSuggestion[];
  onDocumentSelect: (doc: DocumentSuggestion) => void;
  onClose: () => void;
}

const DocumentSuggestionList: React.FC<DocumentSuggestionListProps> = ({ 
  isOpen, 
  anchorEl, 
  documents, 
  onDocumentSelect,
  onClose
}) => {
  const theme = useTheme();
  const [focusedIndex, setFocusedIndex] = useState<number>(-1);
  
  // Reset focused index when documents change
  useEffect(() => {
    setFocusedIndex(-1);
  }, [documents]);
  
  // Handle keyboard navigation
  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (!isOpen) return;
    
    switch (e.key) {
      case 'ArrowDown':
        e.preventDefault();
        setFocusedIndex(prev => 
          prev < documents.length - 1 ? prev + 1 : prev
        );
        break;
      case 'ArrowUp':
        e.preventDefault();
        setFocusedIndex(prev => prev > 0 ? prev - 1 : 0);
        break;
      case 'Enter':
        if (focusedIndex >= 0 && focusedIndex < documents.length) {
          onDocumentSelect(documents[focusedIndex]);
        }
        break;
      case 'Escape':
        onClose();
        break;
    }
  };
  
  if (!isOpen || !anchorEl) return null;
  
  return (
    <Popper 
      open={isOpen} 
      anchorEl={anchorEl}
      placement="top-start"
      sx={{ zIndex: 1300, maxWidth: 400, width: '100%' }}
      role="listbox"
      id="document-suggestion-list"
    >
      <Paper
        elevation={3}
        sx={{ 
          maxHeight: 250, 
          overflow: 'auto',
          border: `1px solid ${theme.palette.divider}`,
          borderRadius: 1,
          mt: 1
        }}
        onKeyDown={handleKeyDown}
      >
        <Box sx={{ p: 1, borderBottom: `1px solid ${theme.palette.divider}`, bgcolor: theme.palette.background.default }}>
          <Typography variant="subtitle2" sx={{ fontWeight: 'bold' }}>
            Documents
          </Typography>
        </Box>
        
        <List dense sx={{ p: 0 }}>
          {documents.length > 0 ? (
            documents.map((doc, index) => (
              <ListItem 
                key={doc.id} 
                disablePadding
                role="option"
                aria-selected={focusedIndex === index}
              >
                <ListItemButton
                  onClick={() => onDocumentSelect(doc)}
                  onFocus={() => setFocusedIndex(index)}
                  tabIndex={focusedIndex === index ? 0 : -1}
                  sx={{
                    '&:hover': {
                      bgcolor: theme.palette.action.hover,
                    },
                    bgcolor: focusedIndex === index ? 
                      theme.palette.action.selected : 'transparent',
                  }}
                >
                  <DescriptionIcon 
                    fontSize="small" 
                    sx={{ mr: 1, color: theme.palette.text.secondary }} 
                  />
                  <ListItemText 
                    primary={doc.name} 
                    secondary={doc.type} 
                    primaryTypographyProps={{ fontWeight: 500 }}
                    secondaryTypographyProps={{ 
                      variant: 'caption',
                      sx: { color: theme.palette.text.secondary }
                    }}
                  />
                </ListItemButton>
              </ListItem>
            ))
          ) : (
            <ListItem>
              <ListItemText 
                primary="No documents found" 
                secondary="Upload documents to reference them"
                primaryTypographyProps={{ color: theme.palette.text.secondary }}
                secondaryTypographyProps={{ 
                  variant: 'caption',
                  sx: { color: theme.palette.text.disabled }
                }}
              />
            </ListItem>
          )}
        </List>
      </Paper>
    </Popper>
  );
};

// Table Reference Modal Component
interface TableReferenceModalProps {
  open: boolean;
  onClose: () => void;
  onSubmit: (tableReferences: TableReference[]) => void;
  initialTableReferences?: TableReference[];
}

const TableReferenceModal: React.FC<TableReferenceModalProps> = ({ 
  open, 
  onClose, 
  onSubmit,
  initialTableReferences = [] 
}) => {
  const [tableReferences, setTableReferences] = useState<TableReference[]>(
    initialTableReferences.length > 0 
      ? initialTableReferences 
      : [{ pageNumber: '', tableNumber: '' }]
  );
  
  const theme = useTheme();
  
  // Reset tableReferences when modal is opened
  useEffect(() => {
    if (open) {
      setTableReferences(
        initialTableReferences.length > 0 
          ? initialTableReferences 
          : [{ pageNumber: '', tableNumber: '' }]
      );
    }
  }, [open, initialTableReferences]);
  
  const handleAddRow = () => {
    setTableReferences([...tableReferences, { pageNumber: '', tableNumber: '' }]);
  };
  
  const handleRemoveRow = (index: number) => {
    setTableReferences(tableReferences.filter((_, i) => i !== index));
  };
  
  const handleChange = (index: number, field: keyof TableReference, value: string) => {
    const newReferences = [...tableReferences];
    newReferences[index][field] = value;
    setTableReferences(newReferences);
  };
  
  const handleSubmit = () => {
    // Validate references
    const validReferences = tableReferences.filter(
      ref => ref.pageNumber.trim() !== '' && ref.tableNumber.trim() !== ''
    );
    
    if (validReferences.length === 0) {
      // If no valid references, add at least one default reference
      onSubmit([{ pageNumber: '1', tableNumber: '1' }]);
    } else {
      onSubmit(validReferences);
    }
  };
  
  return (
    <Dialog 
      open={open} 
      onClose={onClose} 
      maxWidth="sm" 
      fullWidth
      aria-labelledby="table-reference-dialog-title"
    >
      <DialogTitle id="table-reference-dialog-title">
        Select Table References
      </DialogTitle>
      <DialogContent>
        <Typography variant="body2" sx={{ mb: 2 }}>
          Please specify which tables to query. Each table is identified by its page number and table index within that page.
        </Typography>

        <Typography variant="body2" sx={{ mb: 2, fontStyle: 'italic', color: theme.palette.text.secondary }}>
          Tables are stored with the format: {'{timestamp}_p{page_number}_{table_index}_{table_name}'}
        </Typography>
        
        {tableReferences.map((ref, index) => (
          <Box key={index} sx={{ display: 'flex', mb: 2, alignItems: 'flex-start' }}>
            <TextField
              label="Page Number"
              type="text"
              value={ref.pageNumber}
              onChange={(e) => handleChange(index, 'pageNumber', e.target.value)}
              size="small"
              sx={{ mr: 2, width: '120px' }}
              InputProps={{
                startAdornment: <Typography variant="body2" sx={{ mr: 0.5 }}>p</Typography>,
              }}
            />
            <TextField
              label="Table Index"
              type="text"
              value={ref.tableNumber}
              onChange={(e) => handleChange(index, 'tableNumber', e.target.value)}
              size="small"
              sx={{ mr: 2, width: '120px' }}
            />
            <IconButton 
              onClick={() => handleRemoveRow(index)}
              aria-label="Remove table reference"
              color="error"
              size="small"
              sx={{ mt: 1 }}
              disabled={tableReferences.length <= 1}
            >
              <DeleteIcon fontSize="small" />
            </IconButton>
          </Box>
        ))}
        
        <Button
          startIcon={<AddIcon />}
          onClick={handleAddRow}
          size="small"
          sx={{ mt: 1 }}
        >
          Add Another Table
        </Button>
      </DialogContent>
      <DialogActions>
        <Button onClick={onClose} color="inherit">
          Cancel
        </Button>
        <Button onClick={handleSubmit} color="primary" variant="contained">
          Confirm
        </Button>
      </DialogActions>
    </Dialog>
  );
};

const QueryTool: React.FC = () => {
  const theme = useTheme();
  const [messages, setMessages] = useState<ChatMessage[]>([
    // Initial welcome message
    { 
      role: 'assistant', 
      content: "Hello! I'm your document assistant. You can select documents by typing @ in the query box or choose a mode at the bottom left. Ask me anything about your documents!" 
    }
  ]);
  const [input, setInput] = useState<string>('');
  const [loading, setLoading] = useState<boolean>(false);
  const [isRecording, setIsRecording] = useState<boolean>(false);
  const [error, setError] = useState<string | null>(null);
  const [documentFetchError, setDocumentFetchError] = useState<string | null>(null);
  const messagesEndRef = useRef<HTMLDivElement>(null);
  const inputRef = useRef<HTMLInputElement>(null);
  
  // Document mention related states
  const [documents, setDocuments] = useState<DocumentSuggestion[]>([]);
  const [showMentionSuggestions, setShowMentionSuggestions] = useState<boolean>(false);
  const [mentionAnchorEl, setMentionAnchorEl] = useState<null | HTMLElement>(null);
  const [mentionFilter, setMentionFilter] = useState<string>('');
  const [cursorPosition, setCursorPosition] = useState<number>(0);
  const [mentionStartPosition, setMentionStartPosition] = useState<number | null>(null);
  
  // State for selected documents (as chips) - these will now persist between messages
  const [selectedDocuments, setSelectedDocuments] = useState<DocumentMentionWithTables[]>([]);

  // Agent mode selection state
  const [selectedMode, setSelectedMode] = useState<string>('Chat');

  // Table reference modal state
  const [showTableModal, setShowTableModal] = useState<boolean>(false);
  const [activeDocumentForTable, setActiveDocumentForTable] = useState<string | null>(null);
  const [tableStartPosition, setTableStartPosition] = useState<number | null>(null);

  // Create debounced document fetch function
  const debouncedFetchDocuments = useCallback(
    debounce((filterText: string) => {
      getDocumentSuggestions(filterText)
        .then((docs: DocumentSuggestion[]) => {
          setDocuments(docs);
          setDocumentFetchError(null);
        })
        .catch((error: Error) => {
          console.error('Failed to fetch filtered documents:', error);
          // setDocumentFetchError('Failed to load documents. Please try again.');
        });
    }, 300),
    []
  );

  // Fetch user documents on component mount
  useEffect(() => {
    const fetchDocuments = async () => {
      try {
        const docs = await getDocumentSuggestions('');
        setDocuments(docs);
        setDocumentFetchError(null);
      } catch (error) {
        console.error('Failed to fetch documents:', error);
        setDocumentFetchError('Failed to load documents. Please try again.');
      }
    };
    
    fetchDocuments();
  }, []);
  
  // Also fetch documents when showing suggestions with debouncing
  useEffect(() => {
    if (showMentionSuggestions) {
      debouncedFetchDocuments(mentionFilter);
    }
  }, [showMentionSuggestions, mentionFilter, debouncedFetchDocuments]);

  // Scroll to bottom when messages update
  useEffect(() => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' });
  }, [messages]);

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const newValue = e.target.value;
    const cursorPos = e.target.selectionStart || 0;
    
    setInput(newValue);
    setCursorPosition(cursorPos);
    
    // Check for @ symbol
    if (newValue[cursorPos - 1] === '@' && (cursorPos === 1 || newValue[cursorPos - 2] === ' ' || newValue[cursorPos - 2] === '\n')) {
      setMentionStartPosition(cursorPos - 1);
      setMentionFilter('');
      setShowMentionSuggestions(true);
      setMentionAnchorEl(inputRef.current);
      
      // Immediately fetch all documents
      debouncedFetchDocuments('');
    } 
    // Check for / symbol in Analytics mode when a document was recently selected
    else if (
      selectedMode === 'Analytics' && 
      newValue[cursorPos - 1] === '/' && 
      (cursorPos === 1 || newValue[cursorPos - 2] === ' ' || newValue[cursorPos - 2] === '\n') &&
      selectedDocuments.length > 0
    ) {
      // Find the most recently selected document
      const lastSelectedDocId = selectedDocuments[selectedDocuments.length - 1].id;
      
      // Save the position to remove the "/" character later
      setTableStartPosition(cursorPos - 1);
      
      // Set the active document for which we're adding table references
      setActiveDocumentForTable(lastSelectedDocId);
      
      // Show the table reference modal
      setShowTableModal(true);
    }
    // Update filter if we're in mention mode
    else if (mentionStartPosition !== null && cursorPos > mentionStartPosition) {
      const filterText = newValue.substring(mentionStartPosition + 1, cursorPos);
      setMentionFilter(filterText);
    } 
    // Close suggestions if cursor moved before @ symbol
    else if (mentionStartPosition !== null && cursorPos <= mentionStartPosition) {
      setShowMentionSuggestions(false);
      setMentionStartPosition(null);
    }
    
    // Close suggestions if we hit a space after mention started
    if (mentionStartPosition !== null && (newValue[cursorPos - 1] === ' ' || newValue[cursorPos - 1] === '\n')) {
      setShowMentionSuggestions(false);
      setMentionStartPosition(null);
    }
  };

  const handleDocumentMentionClick = (doc: DocumentSuggestion) => {
    if (mentionStartPosition === null) return;
    
    // Add document to selectedDocuments state instead of inserting to input text
    const newDocMention: DocumentMentionWithTables = {
      id: doc.id,
      name: doc.name,
      type: doc.type
    };
    
    // Check if document is already selected to prevent duplicates
    if (!selectedDocuments.some(d => d.id === doc.id)) {
      setSelectedDocuments(prev => [...prev, newDocMention]);
    }
    
    // Remove the @mention text from the input
    const beforeMention = input.substring(0, mentionStartPosition);
    const afterMention = input.substring(cursorPosition);
    const newInput = `${beforeMention}${afterMention}`;
    
    setInput(newInput);
    setShowMentionSuggestions(false);
    setMentionStartPosition(null);
    
    // Set focus back to input with cursor at the right position
    setTimeout(() => {
      if (inputRef.current) {
        inputRef.current.focus();
        const newPosition = mentionStartPosition;
        inputRef.current.setSelectionRange(newPosition, newPosition);
      }
    }, 10);
  };

  const handleRemoveDocument = (docId: string) => {
    setSelectedDocuments(prev => prev.filter(doc => doc.id !== docId));
  };

  const handleTableReferenceSubmit = (tableReferences: TableReference[]) => {
    // Close the modal
    setShowTableModal(false);
    
    if (!activeDocumentForTable) return;
    
    // Update the document with the table references
    setSelectedDocuments(prev => 
      prev.map(doc => 
        doc.id === activeDocumentForTable
          ? { ...doc, tableReferences }
          : doc
      )
    );
    
    // Remove the "/" character from input
    if (tableStartPosition !== null) {
      const beforeSlash = input.substring(0, tableStartPosition);
      const afterSlash = input.substring(tableStartPosition + 1);
      setInput(`${beforeSlash}${afterSlash}`);
      
      // Reset table-related state
      setActiveDocumentForTable(null);
      setTableStartPosition(null);
      
      // Set focus back to input with cursor at the right position
      setTimeout(() => {
        if (inputRef.current) {
          inputRef.current.focus();
          const newPosition = tableStartPosition;
          inputRef.current.setSelectionRange(newPosition, newPosition);
        }
      }, 10);
    }
  };

  const handleTableModalClose = () => {
    setShowTableModal(false);
    setActiveDocumentForTable(null);
    
    // Remove the "/" character from input
    if (tableStartPosition !== null) {
      const beforeSlash = input.substring(0, tableStartPosition);
      const afterSlash = input.substring(tableStartPosition + 1);
      setInput(`${beforeSlash}${afterSlash}`);
      setTableStartPosition(null);
      
      // Set focus back to input
      setTimeout(() => {
        if (inputRef.current) {
          inputRef.current.focus();
          const newPosition = tableStartPosition;
          inputRef.current.setSelectionRange(newPosition, newPosition);
        }
      }, 10);
    }
  };

  const handleSend = async () => {
    if (!input.trim() && selectedDocuments.length === 0) {
      setError('Please enter a message or select at least one document.');
      return;
    }
    
    setError(null);
    
    // Create user message with only text input displayed in chat
    const userMessage: ChatMessage = { 
      role: 'user', 
      content: input,
      mentions: selectedDocuments
    };
    
    setMessages((prev) => [...prev, userMessage]);
    setInput('');
    
    // Send query with documents as metadata (don't reset selectedDocuments)
    await sendQuery(userMessage.content, selectedDocuments);
  };

  const sendQuery = async (query: string, mentions: DocumentMentionWithTables[] = []) => {
    try {
      setLoading(true);
      const data = await apiExecuteQuery(query, mentions, selectedMode);
      if (data.success) {
        const responseMessage: ChatMessage = {
          role: 'assistant',
          content: data.response || 'Response from assistant.'
        };
        setMessages((prev) => [...prev, responseMessage]);
      } else {
        setError(data.error || 'Failed to get response.');
      }
    } catch (err) {
      console.error('Chat error:', err);
      setError('An error occurred while fetching the response.');
    } finally {
      setLoading(false);
    }
  };

  const toggleVoiceRecording = async () => {
    if (isRecording) {
      setIsRecording(false);
      // Stop recording logic if needed
    } else {
      try {
        setIsRecording(true);
        await startVoiceQuery();
      } catch (err) {
        console.error('Voice query error:', err);
        setError('Failed to start voice recognition.');
        setIsRecording(false);
      }
    }
  };

  // Handle Enter key press
  const handleKeyPress = (e: React.KeyboardEvent) => {
    if (e.key === 'Enter' && !e.shiftKey && !showMentionSuggestions) {
      e.preventDefault();
      handleSend();
    }
  };

  // Filter documents for the mention suggestions dropdown
  const filteredDocuments = mentionFilter.trim() === '' 
    ? documents 
    : documents.filter(doc => 
        doc.name.toLowerCase().includes(mentionFilter.toLowerCase()) || 
        doc.id.toLowerCase().includes(mentionFilter.toLowerCase())
      );

  const handleClickAway = () => {
    setShowMentionSuggestions(false);
    setMentionStartPosition(null);
  };

  // Get initial table references for the active document (if any)
  const getInitialTableReferences = () => {
    if (!activeDocumentForTable) return [];
    
    const activeDoc = selectedDocuments.find(doc => doc.id === activeDocumentForTable);
    return activeDoc?.tableReferences || [];
  };

  return (
    <Box
      className="query-tool-container"
      sx={{
        bgcolor: theme.palette.background.default,
      }}
    >
      {/* Chat Conversation Area */}
      <Paper
        className="conversation-area"
        sx={{
          backgroundColor: theme.palette.background.paper,
        }}
      >
        <Box
          className="messages-container"
          role="log"
          aria-live="polite"
          aria-label="Chat conversation"
        >
          {messages.map((msg, index) => (
            <MessageBubble key={index} message={msg} />
          ))}
          <div ref={messagesEndRef} />
        </Box>
      </Paper>

      {error && (
        <Alert severity="error" sx={{ mb: 1 }}>
          {error}
        </Alert>
      )}

      {documentFetchError && (
        <Alert severity="warning" sx={{ mb: 1 }}>
          {documentFetchError}
        </Alert>
      )}

      {/* Message Input Area */}
      <Box
        className="input-area"
        sx={{
          bgcolor: theme.palette.background.paper,
        }}
        role="form"
        aria-label="Message input area"
      >
        {/* Document Chips Area */}
        <DocumentChips 
          documents={selectedDocuments} 
          onRemove={handleRemoveDocument}
          selectedMode={selectedMode}
        />

        {/* Input Field and Buttons */}
        <Box className="input-container">
          <TextField
            fullWidth
            placeholder={selectedMode === 'Analytics' 
              ? "Analytics Mode: Type your query... Use @ for documents, / for tables" 
              : "Chat Mode: Type your message... Use @ to reference documents"
            }
            variant="outlined"
            value={input}
            onChange={handleInputChange}
            onKeyPress={handleKeyPress}
            multiline
            rows={1}
            maxRows={4}
            inputRef={inputRef}
            aria-label="Message input"
            aria-describedby="messageInputHelper"
            sx={{ 
              '& .MuiOutlinedInput-root': {
                borderRadius: '24px',
                backgroundColor: alpha(theme.palette.background.default, 0.5),
                transition: 'all 0.2s ease-in-out',
                '&:hover': {
                  backgroundColor: alpha(theme.palette.background.default, 0.8)
                },
                '&.Mui-focused': {
                  backgroundColor: theme.palette.background.default
                }
              },
              '& .MuiOutlinedInput-notchedOutline': {
                borderColor: alpha(theme.palette.primary.main, 0.2)
              }
            }}
          />
          <Box sx={{ display: 'flex', gap: 1 }}>
            <ModeSelector 
              selectedMode={selectedMode} 
              onModeSelect={setSelectedMode} 
            />
            <Tooltip title={isRecording ? 'Stop Recording' : 'Voice Query'}>
              <span>
                <IconButton
                  className={`voice-button ${isRecording ? 'recording' : ''}`}
                  color={isRecording ? 'secondary' : 'default'}
                  onClick={toggleVoiceRecording}
                  disabled={loading}
                  aria-label={isRecording ? 'Stop voice recording' : 'Start voice recording'}
                >
                  <MicIcon />
                </IconButton>
              </span>
            </Tooltip>
            <Tooltip title="Send Message">
              <span>
                <IconButton 
                  className="send-button"
                  color="primary" 
                  onClick={handleSend} 
                  disabled={loading || (!input.trim() && selectedDocuments.length === 0)}
                  aria-label="Send message"
                  sx={{ 
                    bgcolor: theme.palette.primary.main,
                    color: 'white',
                    p: 1.2,
                    '&.Mui-disabled': {
                      bgcolor: theme.palette.mode === 'dark' 
                        ? theme.palette.grey[800]
                        : theme.palette.grey[300],
                    }
                  }}
                >
                  <SendIcon />
                </IconButton>
              </span>
            </Tooltip>
          </Box>
        </Box>
        
        {/* Document mention suggestions dropdown with improved keyboard navigation */}
        <ClickAwayListener onClickAway={handleClickAway}>
          <div>
            <Grow in={showMentionSuggestions} timeout={150}>
              <div>
                <DocumentSuggestionList 
                  isOpen={showMentionSuggestions}
                  anchorEl={mentionAnchorEl}
                  documents={filteredDocuments}
                  onDocumentSelect={handleDocumentMentionClick}
                  onClose={handleClickAway}
                />
              </div>
            </Grow>
          </div>
        </ClickAwayListener>
        
        {/* Table Reference Modal */}
        <TableReferenceModal
          open={showTableModal}
          onClose={handleTableModalClose}
          onSubmit={handleTableReferenceSubmit}
          initialTableReferences={getInitialTableReferences()}
        />
        
        <Typography id="messageInputHelper" sx={{ position: 'absolute', left: '-9999px' }}>
          {selectedMode === 'Analytics' 
            ? "Currently in Analytics Mode. Type your query. Use the @ symbol to reference documents. Use / after document selection to specify tables. Press Enter to send."
            : "Currently in Chat Mode. Type your message. Use the @ symbol to reference documents. Press Enter to send."
          }
        </Typography>
      </Box>

      {loading && (
        <Box sx={{ display: 'flex', justifyContent: 'center', mt: 1 }}>
          <CircularProgress size={24} aria-label="Loading response" />
        </Box>
      )}
    </Box>
  );
};

export default QueryTool;