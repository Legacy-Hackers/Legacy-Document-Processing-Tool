import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import AppThemeProvider from './theme/AppThemeProvider';
import Layout from './layout/layout';
import HomePage from './pages/HomePage';
import QueryTool from './pages/QueryTool/QueryTool';
import UploadFilePage from './pages/UploadFile';
import MyDocuments from './pages/MyDocuments';
import DocumentPage from './components/DocumentPage';
// import Visualizations from './pages/Visualizations';
import './App.css';

function App() {
  return (
    <AppThemeProvider>
      <Router>
        <Routes>
          <Route path="/" element={<Layout><HomePage /></Layout>} />
          <Route path="/upload" element={<Layout><UploadFilePage /></Layout>} />
          <Route path="/pdf-list" element={<Layout><MyDocuments /></Layout>} />
          <Route path="/query-tool" element={<Layout><QueryTool /></Layout>} />
          <Route path="/documents/:id" element={<Layout><DocumentPage /></Layout>} />
          {/* <Route path="/visualizations" element={<Layout><Visualizations /></Layout>} /> */}
          <Route path="*" element={<Layout><HomePage /></Layout>} />
        </Routes>
      </Router>
    </AppThemeProvider>
  );
}

export default App;
