import { useState, useEffect } from 'react'
import './App.css'
import Header from './components/Header/Header'
import { Route, Routes } from 'react-router-dom'
import Home from './components/Home/Home'
import Jewelry from './components/Jewelry/Jewelry'
import SaleOff from './components/SaleOff/SaleOff'
import Collection from './components/Collections/Collection'
import Product from './components/Product/Product'
import JewCollection from './components/Collections/JewCollection'
import Footer from './components/Footer/Footer'
import JewelryType from './components/Jewelry/JewelryType'
import Search from './components/Search/Search'
import Authentic from './components/Authentic/Authentic'

function App() {
  
  return (
    <div className='app'>
      <Header />

      <div className='container'>
        <Routes>
          <Route path="/" element={<Home />}/>
          <Route path="jewelry" element={<JewelryType />}/>
          <Route path="jewelry/:type" element={<Jewelry />}/>
          <Route path="product/:id" element={<Product />} />
          <Route path="sale-off" element={<SaleOff />}/>
          <Route path="collection" element={<Collection />} />
          <Route path="collection/:col" element={<JewCollection />} />
          <Route path="search" element={<Search />} />
          <Route path="login" element={<Authentic />} />
        </Routes>
      </div>

      <Footer />
    </div>
  )
}

export default App
