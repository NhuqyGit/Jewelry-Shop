import { useState, useEffect } from "react";
import "./Collection.scss"

function Collection() {
    const sevPath="http://127.0.0.1:8080"
    const [col, setCol] = useState([])
    useEffect(()=>{
        fetch("http://127.0.0.1:8080/collection", {
            method: "GET"
        })
        .then((response)=>response.json())
        .then((data)=>{
            setCol(data)
        })
        .catch((error)=>{
        console.error("Fail so fetch !!!!", error)
        })
    }, [])
    
    const listCol = col ? col.map((c)=>{
        return (
            <div key={c.IdColl} className="coll-card">
                <div className="coll-header">

                </div>
                <div className="coll-body">
                    <a href={`/collection/${c.IdColl}`}>
                        <img src={sevPath + c.CollImage} alt=""></img>
                    </a>
                </div>
                <div className="coll-footer">
                    <a>
                        <h4>{c.CollName}</h4>
                    </a>
                </div>
            </div>
        )
    }) : null

    return ( 
        <div className="coll-container">
            <div className="coll-row">
                {listCol}
            </div>                
            
            {/* {col ? <h1 style={{color: "red"}}>{col[0].CollName}</h1> : null} */}
        </div>
     );
}

export default Collection;