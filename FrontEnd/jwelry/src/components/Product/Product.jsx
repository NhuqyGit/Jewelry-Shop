import { useState,useEffect } from "react";
import "./Product.scss"
import { useParams } from "react-router-dom";
import { URL_FE, URL_BE } from "../../../url/url";

function Product() {
    // const [queryParameters] = useSearchParams()
    // const id = queryParameters.get("id")
    const [jew, setJew] = useState()
    const { id } = useParams()
    console.log("jew:", jew)

    useEffect (()=>{
        fetch(`${URL_BE}/product/${id}`, {
            method: "GET"
        })
        .then((response)=>response.json())
        .then((data)=>{
            // console.log(data)
            setJew(data)
        })
        .catch((error)=>{
        console.error("Fail so fetch !!!!", error)
        })
    }, [])
    return (
        <div>
          {jew ? (
            <div>
              <h1 style={{ color: "red" }}>{jew.jewName}</h1>
            </div>
          ) : null}
        </div>
    );
      
}

export default Product;