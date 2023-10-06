import { useEffect } from "react";
import { useNavigate, useParams } from "react-router-dom";

function VerifyEmailSuccess() {
    const {id, token} = useParams()
    const navigate = useNavigate()
    useEffect(()=>{
        fetch(`http://127.0.0.1:8080/verify-email/${id}/${token}`, {
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
                  navigate("/login");
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
        <div className="verifyEmail-success">
            <h1>Verify success</h1>
        </div>
    );
}

export default VerifyEmailSuccess;