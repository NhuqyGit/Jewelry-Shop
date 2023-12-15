import { useState, useEffect } from "react"
import Card from "../Card/Card"
import { useParams } from "react-router-dom";
import "./Jewelry.scss"

function Jewelry() {
    const [jew, setJew] = useState([])
    const [jewType, setJewType] = useState([])
    const { type } = useParams()
    const listType = ["ring", "glasses", "necklace", "bracelet", "earrings"]
    useEffect(()=>{
        var _url
        if (type === null || type === undefined){
            _url = "https://jewelry-shop-bs1i.onrender.com/jewelry"
            console.log("type1")
        }
        else if(type === "all-products"){
            _url = "https://jewelry-shop-bs1i.onrender.com/jewelry/all-products"
        }
        else{
            _url = `https://jewelry-shop-bs1i.onrender.com/jewelry/${type}`
            console.log("type2")
        }
        fetch(_url, {
            method: "GET"
        })
            .then((response)=>response.json())
            .then((data)=>{
                setJew(data)
                console.log(data)
            })
            .catch((error)=>{
            console.error("Fail so fetch data all products !!!!", error)
            })

        fetch("https://jewelry-shop-bs1i.onrender.com/product-types", {
            method: "GET"
        })
            .then((response)=>response.json())
            .then((data)=>{
                setJewType(data)
            })
            .catch((error)=>{
            console.error("Fail so fetch data jewtype !!!!", error)
            })
    }, [])
    console.log(typeof(jew))
    const listJew = (jew != null) ? jew.map((j)=>{
        return (
            <Card key={j.idJew} jew={j} />
        )
    }) : null

    const listJewTYpe = (jewType != null) ? jewType.map((j, index)=>{
        return (
            <a  key={j.IdType}
                className="type-card"
                href={`https://jewelry-shop-6gb2.vercel.app/jewelry/${listType[index]}`}
                style={type===listType[index] ? {opacity: "1"} : null}>
                <div className="type-image">
                    <img src={j.TypeImage} alt="" />
                </div>
                <div className="type-name">
                    <span>{j.TypeName}</span>
                </div>
            </a>
        )
    }) : null
    return ( 
        <div className="jewelry-container">
            <div className="jewelry-type">
                <a className="all-btn" href="https://jewelry-shop-6gb2.vercel.app/jewelry/all-products">All Items</a>
                <div className="jewelry-type__container">
                    {listJewTYpe}
                </div>
            </div>
            <div className="jewelry-ant__rows">
                {listJew}
            </div>
        </div>
     );
}

export default Jewelry;