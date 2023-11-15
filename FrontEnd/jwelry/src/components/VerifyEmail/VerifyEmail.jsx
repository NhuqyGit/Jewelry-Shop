import { useNavigate, useParams } from "react-router-dom";
import "./VerifyEmail.scss"

function VerifyEmail() {
    const { id } = useParams()
    const navigate = useNavigate()

    const handleClick = () => {
      fetch(`http://127.0.0.1:8080/send-email/${id}`, {
            method: "GET"
        })
        .then((response)=>response.json())
        .then((data)=>{
          console.log(data)
        })
        .catch((error)=>{
          console.error("Fail to fetch !!!!", error)
        })
    }

    return (
      <div className="verifyEmail">
        <div className="container">
          <div className="logo">
              <span>NHUQY</span>
              <span className="L">L</span>
              <span>O</span>
          </div>
          <div className="a">
              <span>Verify your email</span>
              <p>We've sent an email to your inbox. Please verify your email address so we know that it is exactly you!</p>
          </div>

          <button className="resend-email" onClick={handleClick}>Resend email</button>
        </div>
      </div>
    );
}

export default VerifyEmail;