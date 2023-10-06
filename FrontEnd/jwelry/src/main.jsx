import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.jsx'
import Admin from './components/Admin/Admin.jsx'
import './index.css'
import Insert from './components/Admin/Insert.jsx'
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import VerifyEmail from './components/VerifyEmail/VerifyEmail.jsx'
import VerifyEmailSuccess from './components/VerifyEmail/VerifyEmailSuccess.jsx'

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <Router>
      <Routes>
        <Route path='/*' element={<App />} />
        <Route path='/admin/' element={<Admin />}>
          <Route path='insert' element={<Insert />} />
        </Route>
        <Route path='/verifyemail' element={<VerifyEmail />} />
        <Route path='/verifyemailsuccess/:id/:token' element={<VerifyEmailSuccess />} />
      </Routes>
    </Router>
  </React.StrictMode>,
)
