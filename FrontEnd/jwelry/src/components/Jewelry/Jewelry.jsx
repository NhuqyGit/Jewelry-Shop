import { useState, useEffect } from "react"
import Card from "../Card/Card"

function Jewelry() {
    const [jew, setJew] = useState([])
    useEffect(()=>{
    fetch("http://127.0.0.1:8080/all-products", {
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
        <div>
            {listJew}
        </div>
     );
}

export default Jewelry;