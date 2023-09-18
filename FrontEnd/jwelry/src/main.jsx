import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.jsx'
import Admin from './components/Admin/Admin.jsx'
import './index.css'
import Insert from './components/Admin/Insert.jsx'
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <Router>
      <Routes>
        <Route path='/*' element={<App />} />
        <Route path='/admin/' element={<Admin />}>
          <Route path='insert' element={<Insert />} />
        </Route>
      </Routes>
    </Router>
  </React.StrictMode>,
)
