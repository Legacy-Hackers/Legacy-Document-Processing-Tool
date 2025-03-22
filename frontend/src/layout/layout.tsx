import React, { ReactNode, useState } from 'react';
import {
  AppBar,
  Box,
  CssBaseline,
  Divider,
  Drawer,
  IconButton,
  List,
  ListItem,
  ListItemButton,
  ListItemIcon,
  ListItemText,
  Toolbar,
  Typography,
  Button,
  useTheme,
  useMediaQuery,
  Tooltip
} from '@mui/material';
import { Link as RouterLink, useLocation, useNavigate } from 'react-router-dom';

// Icons
import MenuIcon from '@mui/icons-material/Menu';
import MenuOpenIcon from '@mui/icons-material/MenuOpen';
import HomeIcon from '@mui/icons-material/Home';
import BarChartIcon from '@mui/icons-material/BarChart';
import FolderIcon from '@mui/icons-material/Folder';
import QuestionAnswerIcon from '@mui/icons-material/QuestionAnswer';

// Theme context
import { useThemeContext } from '../theme/AppThemeProvider';
import Brightness4Icon from '@mui/icons-material/Brightness4';
import Brightness7Icon from '@mui/icons-material/Brightness7';

interface LayoutProps {
  children: ReactNode;
}

// Navigation items
const navItems = [
  { text: 'Home', path: '/', icon: <HomeIcon /> },
  // { text: 'Dashboard', path: '/dashboard', icon: <DashboardIcon /> },
  { text: 'Upload Documents', path: '/upload', icon: <FolderIcon /> },
  { text: 'My Documents', path: '/pdf-list', icon: <FolderIcon /> },
  // { text: 'Visualizations', path: '/visualizations', icon: <BarChartIcon /> },
  { text: 'Query Tool', path: '/query-tool', icon: <QuestionAnswerIcon /> },
];

const drawerWidth = 280;

const Layout: React.FC<LayoutProps> = ({ children }) => {
  const theme = useTheme();
  const { mode, toggleColorMode } = useThemeContext();
  const location = useLocation();
  const navigate = useNavigate();
  const isMobile = useMediaQuery(theme.breakpoints.down('md'));
  const [mobileOpen, setMobileOpen] = useState(false);
  const [isDrawerOpen, setIsDrawerOpen] = useState(true);

  const handleDrawerToggle = () => {
    if (isMobile) {
      setMobileOpen(!mobileOpen);
    } else {
      setIsDrawerOpen(!isDrawerOpen);
    }
  };

  const drawer = (
    <Box sx={{ display: 'flex', flexDirection: 'column', height: '100%' }}>
      <Box sx={{ p: 3, display: 'flex', alignItems: 'left', justifyContent: 'left' }}>
        <Typography variant="h5" fontWeight="bold" sx={{ color: theme.palette.mode === 'light' ? "black" : "white" }}>
          Menu
        </Typography>
      </Box>
      <Divider sx={{ mb: 2 }} />
      <List sx={{ flexGrow: 1, px: 2 }}>
        {navItems.map((item) => {
          const isSelected = location.pathname === item.path;
          
          return (
            <ListItem key={item.text} disablePadding sx={{ mb: 1 }}>
              <ListItemButton
                component={RouterLink}
                to={item.path}
                selected={isSelected}
                sx={{
                  position: 'relative',
                  p: 1.8,
                  borderRadius: 1,
                  overflow: 'hidden',
                  '&::before': {
                    content: '""',
                    position: 'absolute',
                    left: 0,
                    top: 0,
                    width: '4px',
                    height: '100%',
                    backgroundColor: 'transparent',
                    transition: theme.transitions.create('background-color', {
                      duration: theme.transitions.duration.shorter,
                    }),
                  },
                  '&.Mui-selected': {
                    backgroundColor: theme.palette.mode === 'light' 
                      ? `${theme.palette.primary.light}15`
                      : `${theme.palette.primary.dark}30`,
                    '&::before': {
                      backgroundColor: theme.palette.mode === 'light'
                        ? theme.palette.primary.main
                        : theme.palette.primary.main,
                    },
                    '& .MuiListItemIcon-root': {
                      color: theme.palette.primary.main,
                    },
                    '& .MuiTypography-root': {
                      color: theme.palette.primary.main,
                      fontWeight: 600,
                    },
                  },
                  '&:hover': {
                    backgroundColor: theme.palette.mode === 'light' 
                      ? `${theme.palette.primary.light}10`
                      : `${theme.palette.primary.dark}20`,
                    '&::before': {
                      backgroundColor: isSelected ? theme.palette.primary.main : 
                        theme.palette.mode === 'light' ? 'black' : 'rgba(255, 255, 255, 0.8)',
                    },
                  },
                  transition: theme.transitions.create(['background-color', 'color'], {
                    duration: theme.transitions.duration.standard,
                  }),
                }}
              >
                <ListItemIcon 
                  sx={{ 
                    minWidth: 40,
                    color: isSelected 
                      ? theme.palette.primary.main 
                      : theme.palette.text.secondary,
                    transition: theme.transitions.create('color', {
                      duration: theme.transitions.duration.standard,
                    }),
                  }}
                >
                  {item.icon}
                </ListItemIcon>
                <ListItemText 
                  primary={item.text} 
                  primaryTypographyProps={{ 
                    fontWeight: isSelected ? 600 : 400,
                    fontSize: '0.95rem',
                    sx: {
                      transition: theme.transitions.create('color', {
                        duration: theme.transitions.duration.standard,
                      }),
                    }
                  }}
                />
              </ListItemButton>
            </ListItem>
          );
        })}
      </List>
      <Divider sx={{ mt: 2 }} />
      <Box sx={{ p: 3, display: 'flex', justifyContent: 'center' }}>
        <Button
          variant="outlined"
          onClick={toggleColorMode}
          startIcon={mode === 'dark' ? <Brightness7Icon /> : <Brightness4Icon />}
          sx={{
            borderRadius: 2,
            px: 2,
            py: 1,
            transition: theme.transitions.create(['background-color', 'box-shadow'], {
              duration: theme.transitions.duration.standard,
            }),
            '&:hover': {
              boxShadow: theme.shadows[2],
            }
          }}
        >
          {mode === 'dark' ? 'Light Mode' : 'Dark Mode'}
        </Button>
      </Box>
    </Box>
  );

  // Use different container based on screen size
  const container = window !== undefined ? window.document.body : undefined;

  return (
    <Box sx={{ display: 'flex', minHeight: '100vh' }}>
      <CssBaseline />
      <AppBar
        position="fixed"
        elevation={0}
        sx={{
          width: { 
            xs: '100%',
            md: isDrawerOpen ? `calc(100% - ${drawerWidth}px)` : '100%' 
          },
          ml: { 
            xs: 0,
            md: isDrawerOpen ? `${drawerWidth}px` : 0 
          },
          boxShadow: '0 4px 20px 0 rgba(0,0,0,0.05)',
          backdropFilter: 'blur(8px)',
          backgroundColor: theme.palette.mode === 'light' 
            ? 'rgba(255, 255, 255, 0.9)' 
            : 'rgba(18, 18, 18, 0.9)',
          transition: theme.transitions.create(['width', 'margin'], {
            easing: theme.transitions.easing.sharp,
            duration: theme.transitions.duration.enteringScreen,
          }),
        }}
      >
        <Toolbar sx={{ px: { xs: 2, sm: 4 } }}>
          <IconButton
            color="inherit"
            aria-label={isDrawerOpen ? "close drawer" : "open drawer"}
            edge="start"
            onClick={handleDrawerToggle}
            sx={{ 
              mr: 2, 
              color: theme.palette.primary.main,
              transition: theme.transitions.create('transform', {
                duration: theme.transitions.duration.standard,
              }),
              '&:hover': {
                transform: 'scale(1.1)',
              }
            }}
          >
            {isMobile ? <MenuIcon /> : (isDrawerOpen ? <MenuOpenIcon /> : <MenuIcon />)}
          </IconButton>
          <Typography
            variant="h6"
            noWrap
            component={RouterLink}
            to="/"
            sx={{ 
              flexGrow: 1, 
              fontWeight: 600,
              color: theme.palette.primary.main,
              letterSpacing: '0.5px',
              textDecoration: 'none',
              cursor: 'pointer',
              transition: theme.transitions.create(['color', 'transform'], {
                duration: theme.transitions.duration.shorter,
              }),
              '&:hover': {
                color: theme.palette.primary.dark,
              }
            }}
          >
            Legacy Document Management System
          </Typography>
          
          {/* Quick access to Query Tool */}
          <Tooltip title="Query Tool">
            <IconButton 
              sx={{ 
                mr: 1,
                color: theme.palette.mode === 'light' ? theme.palette.grey[700] : 'inherit',
                transition: theme.transitions.create('transform', {
                  duration: theme.transitions.duration.shorter,
                }),
                '&:hover': {
                  transform: 'scale(1.1)',
                  color: theme.palette.primary.main,
                }
              }}
              onClick={() => navigate('/query-tool')}
            >
              <QuestionAnswerIcon />
            </IconButton>
          </Tooltip>
          
          <IconButton 
            sx={{ 
              ml: 1,
              color: theme.palette.mode === 'light' ? theme.palette.grey[700] : 'inherit',
              transition: theme.transitions.create('transform', {
                duration: theme.transitions.duration.shorter,
              }),
              '&:hover': {
                transform: 'scale(1.1)',
                color: theme.palette.primary.main,
              }
            }} 
            onClick={toggleColorMode} 
          >
            {theme.palette.mode === 'dark' ? <Brightness7Icon /> : <Brightness4Icon />}
          </IconButton>
        </Toolbar>
      </AppBar>
      <Box
        component="nav"
        sx={{ width: { md: isDrawerOpen ? drawerWidth : 0 }, flexShrink: { md: 0 } }}
        aria-label="navigation links"
      >
        {/* Mobile drawer */}
        <Drawer
          container={container}
          variant="temporary"
          open={mobileOpen}
          onClose={handleDrawerToggle}
          ModalProps={{
            keepMounted: true, // Better open performance on mobile.
          }}
          sx={{
            display: { xs: 'block', md: 'none' },
            '& .MuiDrawer-paper': { 
              boxSizing: 'border-box', 
              width: drawerWidth,
              boxShadow: '0 8px 24px rgba(0,0,0,0.12)',
            },
          }}
        >
          {drawer}
        </Drawer>
        
        {/* Desktop drawer */}
        <Drawer
          variant="permanent"
          sx={{
            display: { xs: 'none', md: 'block' },
            '& .MuiDrawer-paper': { 
              boxSizing: 'border-box', 
              width: drawerWidth,
              boxShadow: '0 8px 24px rgba(0,0,0,0.05)',
              transform: isDrawerOpen ? 'translateX(0)' : 'translateX(-100%)',
              transition: theme.transitions.create('transform', {
                easing: theme.transitions.easing.sharp,
                duration: theme.transitions.duration.enteringScreen,
              }),
              borderRight: `1px solid ${theme.palette.mode === 'light' ? 'rgba(0,0,0,0.08)' : 'rgba(255,255,255,0.08)'}`
            },
          }}
          open={isDrawerOpen}
        >
          {drawer}
        </Drawer>
      </Box>
      <Box
        component="main"
        sx={{
          flexGrow: 1,
          p: { xs: 2, sm: 3, md: 4 },
          width: { 
            xs: '100%', 
            md: isDrawerOpen ? `calc(100% - ${drawerWidth}px)` : '100%' 
          },
          ml: { 
            xs: 0,
            md: 0
          },
          minHeight: '100vh',
          display: 'flex',
          flexDirection: 'column',
          backgroundColor: theme.palette.background.default,
          transition: theme.transitions.create(['width', 'margin'], {
            easing: theme.transitions.easing.sharp,
            duration: theme.transitions.duration.enteringScreen,
          }),
        }}
      >
        <Toolbar /> {/* This toolbar is for spacing to push content below the app bar */}
        <Box sx={{ flexGrow: 1 }}>{children}</Box>
      </Box>
    </Box>
  );
};

export default Layout;