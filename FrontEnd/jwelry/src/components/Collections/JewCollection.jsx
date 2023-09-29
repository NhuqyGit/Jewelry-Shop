import { useState, useEffect } from "react"
import Card from "../Card/Card"
import { useParams } from "react-router-dom";
import "./JewCollection.scss"

function JewCollection() {
    const [jew, setJew] = useState([])
    const { col } = useParams()
    useEffect(()=>{
    fetch(`http://127.0.0.1:8080/collection/${col}`, {
        method: "GET"
    })
        .then((response)=>response.json())
        .then((data)=>{
            setJew(data)
        })
        .catch((error)=>{
        console.error("Fail so fetch !!!!", error)
        })
    }, [])
    const listJew = (jew != null) ? jew.map((j)=>{
        return (
            <Card key={j.idJew} jew={j} />
        )
    }) : null
    return ( 
        <div className="jewelry-container">
            <div className="jewelry-list">
                <div className="jewelry-ant__rows">
                    {listJew}
                </div>
            </div>
        </div>
    );
}

export default JewCollection;