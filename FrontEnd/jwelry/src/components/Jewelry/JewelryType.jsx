import { useState, useEffect } from "react";
import "./JewelryType.scss"
import ring1 from "../../assets/ring1.png"
import ring2 from "../../assets/ring2.png"

function JewelryType() {
    const sevPath="https://jewelry-shop-bs1i.onrender.com/"
    const [_type, setType] = useState([])
    useEffect(()=>{
        fetch("https://jewelry-shop-bs1i.onrender.com/product-types", {
            method: "GET"
        })
        .then((response)=>response.json())
        .then((data)=>{
            setType(data)
        })
        .catch((error)=>{
        console.error("Fail so fetch !!!!", error)
        })
    }, [])

    const listType = _type ? _type.map((t, index)=>{
        return (
            <div key={t.IdType} className="type-card">
                <div className="type-header">

                </div>
                <div className="type-body">
                    <a href={`/jewelry/${t.TypeName.toLowerCase()}`}>
                        <img style={index===_type.length - 1 ? {width: "95%", height: "95%"} : null} src={t.TypeImage} alt="" />
                        <img src={index % 2 === 0 ? ring1 : ring2} alt="" />
                    </a>
                </div>
                <div className="type-footer">
                    <a>
                        <h4>{t.TypeName}</h4>
                    </a>
                </div>
            </div>
        )
    }) : null

    return ( 
        <div className="type-container">
            <div className="type-row">
                {listType}
            </div>                
            
            {/* {col ? <h1 style={{color: "red"}}>{col[0].CollName}</h1> : null} */}
        </div>
     );
}

export default JewelryType;