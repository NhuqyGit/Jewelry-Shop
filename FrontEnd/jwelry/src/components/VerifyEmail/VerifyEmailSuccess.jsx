import { useEffect } from "react";
import { useNavigate, useParams } from "react-router-dom";
import icon from "../../assets/icon-success.svg";
import "./VerifyEmailSuccess.scss"

function VerifyEmailSuccess() {
    const {id, token} = useParams()
    const navigate = useNavigate()
    useEffect(()=>{
        fetch(`https://jewelry-shop-bs1i.onrender.com/verify-email/${id}/${token}`, {
            method: "GET"
        })
        .then((response)=>{
            if (!response.ok) {
              throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.json();
          })
        .then((data)=>{
            if (data && data.status === true) {
              setTimeout(() => {
                navigate("/login")
              }, 3000);
            } else {
              console.error("API response is invalid or empty.");
            }
        })
        .catch((error)=>{
            console.error("Fail so fetch username !!!!", error)
        })
    }, [])
    return (
      <div className="success-container">
        <div className="a">
            <img src={icon} alt=""/>
            <h1>Verify Successfull!</h1>
            {/* <p>A confirmation email has been sent to <b>ash@loremcompany.com</b>. Please open it and click the link inside to verify your email.</p> */}
            {/* <button onClick={()=>{navigate("/login")}}>Dismiss message</button> */}
        </div>
      </div>
    );
}

export default VerifyEmailSuccess;