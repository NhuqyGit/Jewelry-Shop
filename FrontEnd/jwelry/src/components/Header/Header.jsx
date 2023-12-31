import {Link, BrowserRouter, useParams, useSearchParams} from "react-router-dom"
import { NavLink} from "react-router-dom";
import "./Header.scss"
import { useState } from "react";


function Header() {
    const _path = useParams()["*"]
    const [isOpen, setOpen] = useState(false)
    console.log(_path)
    return ( 
        <>
            <header>
                <div className="header-container" style={_path === "collection" || _path === "jewelry" ? {border: "none"} : {border: "1px solid #fff"}}>
                    <div className="logo">
                        <Link to="/">
                            <span>NHUQY</span>
                            <span className="L">L</span>
                            <span>O</span>
                        </Link>
                    </div>

                    <div className="nav">
                        <ul className="nav-menu">
                            <li><NavLink to="/jewelry">Jewelry</NavLink></li>
                            <li><NavLink to="/sale-off">Sale Off</NavLink></li>
                            <li><NavLink to="/collection">Collection</NavLink></li>
                            <li><NavLink to="/contact">Contact</NavLink></li>
                            <li><NavLink to="/login">Login</NavLink></li>
                        </ul>
                    </div>

                    <div className="left">
                        <div className="btn-search" onClick={()=>setOpen(!isOpen)}>
                            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 129 129" xmlnsXlink="http://www.w3.org/1999/xlink" enableBackground="new 0 0 129 129">
                                <g>
                                    <path d="M51.6,96.7c11,0,21-3.9,28.8-10.5l35,35c0.8,0.8,1.8,1.2,2.9,1.2s2.1-0.4,2.9-1.2c1.6-1.6,1.6-4.2,0-5.8l-35-35   c6.5-7.8,10.5-17.9,10.5-28.8c0-24.9-20.2-45.1-45.1-45.1C26.8,6.5,6.5,26.8,6.5,51.6C6.5,76.5,26.8,96.7,51.6,96.7z M51.6,14.7   c20.4,0,36.9,16.6,36.9,36.9C88.5,72,72,88.5,51.6,88.5c-20.4,0-36.9-16.6-36.9-36.9C14.7,31.3,31.3,14.7,51.6,14.7z"/>
                                </g>
                            </svg>
                        </div>

                        <div className="btn-cart">
                            <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><title/><g id="Shops"><path d="M27.92,24.08l-2.24-13A4.73,4.73,0,0,0,21.14,7H21A5,5,0,0,0,11,7h-.14a4.73,4.73,0,0,0-4.54,4.08l-2.24,13a5.23,5.23,0,0,0,1.13,4.29A4.45,4.45,0,0,0,8.62,30H23.38a4.45,4.45,0,0,0,3.41-1.63A5.23,5.23,0,0,0,27.92,24.08ZM16,4a3,3,0,0,1,3,3H13A3,3,0,0,1,16,4Zm9.26,23.08a2.45,2.45,0,0,1-1.88.92H8.62a2.45,2.45,0,0,1-1.88-.92,3.21,3.21,0,0,1-.69-2.66l2.24-13A2.74,2.74,0,0,1,10.86,9H21.14a2.74,2.74,0,0,1,2.57,2.42l2.24,13A3.21,3.21,0,0,1,25.26,27.08Z"/></g></svg>
                            <span className="quantity-cart">0</span>
                        </div>
                    </div>
                </div>

                <div className={"search-bar" + (isOpen ? " open" : "")}>
                    <form method="GET" action="/search">
                        <input placeholder="input your keyword" name="keyword"></input>
                    </form>
                </div>
            </header>
        </>
    );
}

export default Header;