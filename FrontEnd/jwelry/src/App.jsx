import { useState, useEffect } from 'react'
import './App.css'
import Header from './components/Header/Header'
import { Route, Routes } from 'react-router-dom'
import Home from './components/Home/Home'
import Jewelry from './components/Jewelry/Jewelry'
import SaleOff from './components/SaleOff/SaleOff'
import Collection from './components/Collections/Collection'
import Product from './components/Product/Product'

function App() {
  
  return (
    <div className='app'>
      <Header />

      <div className='container'>
        <Routes>
          <Route path="/" element={<Home />}/>
          <Route path="all-products" element={<Jewelry />}/>
          <Route path="sale-off" element={<SaleOff />}/>
          <Route path="collection" element={<Collection />}/>
          <Route path="product/:id" element={<Product />} />
        </Routes>
      </div>
    </div>
  )
}

export default App
