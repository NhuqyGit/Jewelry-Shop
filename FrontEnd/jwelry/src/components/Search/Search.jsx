import { useLocation } from "react-router-dom";
import "./Search.scss"
import { useState, useEffect } from "react";

function Search() {
    const [jew, setJew] = useState([])
    const location = useLocation();
    const searchParams = new URLSearchParams(location.search);
    const [input, setInput] = useState(searchParams.get("keyword"))

    useEffect(() => {
        const _url = `https://jewelry-shop-bs1i.onrender.com/search?keyword=${input}`
        fetch(_url, {
            method: "GET"
        })
            .then((response) => response.json())
            .then((data) => {
                setJew(data)
                console.log(data)
            })
            .catch((error) => {
                console.error("Failed to fetch data for all products!", error)
            })
    }, [input])
    const listJew = jew ? jew.map((a) => (
        <div key={a.id}>
            <h1>{a.jewName}</h1>
        </div>
    )) : <p>No matching products found</p>

    return (
        <div className="search-container">
            <input placeholder="input" value={input} onChange={(e)=>setInput(e.target.value)} maxLength={10}/>
            <div className="search-jew">
                {listJew}
            </div>
        </div>
    );
}

export default Search;
