import { useEffect, useState } from "react";
import Axios from "axios";
import "./Authentic.scss"
import { useNavigate } from "react-router-dom";
function Authentic() {
    const navigate = useNavigate()
    const [username, setUsername] = useState("")
    const [email, setEmail] = useState("")
    const [password, setPassword] = useState("")

    const [auth, setAuth] = useState(0)

    const [isPwTyping, setPwTyping] = useState(false)
    const [isEmailTyping, setEmailTyping] = useState(false)
    const [isUsernameTyping, setUsernameTyping] = useState(false)

    const [emailSt, setEmailSt] = useState(false)
    const [usernameSt, setUsernameSt] = useState(false)
    const usernameRegex = /^.{7,}$/
    const passwordRegex = /^(?=.*[A-Z])(?=.*[\W_]).{8,}$/;
    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    const usernameValid = usernameRegex.test(username)
    const emailValid = emailRegex.test(email)
    const passwordValid = passwordRegex.test(password)
    
    useEffect(()=>{
        fetch(`http://127.0.0.1:8080/isEmailExist?email=${email}`, {
            method: "GET"
        })
        .then((response)=>response.json())
        .then((data)=>{
            setEmailSt(data.status)
        })
        .catch((error)=>{
            console.error("Fail so fetch email !!!!", error)
        })
    }, [email])

    useEffect(()=>{
        fetch(`http://127.0.0.1:8080/isUsernameExist?username=${username}`, {
            method: "GET"
        })
        .then((response)=>response.json())
        .then((data)=>{
            setUsernameSt(data.status)
        })
        .catch((error)=>{
            console.error("Fail so fetch username !!!!", error)
        })
    }, [username])

    const handlePasswordChange = (e) => {
        setPassword(e.target.value);
        setPwTyping(true);
    };

    const handleEmailChange = (e) => {
        setEmail(e.target.value);
        setEmailTyping(true);
    };

    const handleUsernameChange = (e) => {
        setUsername(e.target.value);
        setUsernameTyping(true);
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        const data = {
            username: username,
            password: password,
            email: email,
        };
    
        // Gửi dữ liệu bằng Axios
        Axios.post("http://127.0.0.1:8080/signup", data)
        .then((response) => {
            // Xử lý khi gửi thành công
            console.log("Đăng ký thành công:", response.data);
            // Thực hiện các hành động khác, ví dụ: chuyển hướng người dùng đến trang đăng nhập
            navigate("/verifyemail")
        })
        .catch((error) => {
            // Xử lý khi gửi thất bại
            console.error("Lỗi khi đăng ký:", error);
        });
    }


    return ( 
        <div className="auth-container">
            <div className="auth-general">
                <div className="auth-control">
                    <div className={"login-btn " + (auth === 0 ? "active" : "")}
                         onClick={()=>setAuth(0)}
                    >
                        <span>Login</span>
                    </div>
                    <div className={"signup-btn " + (auth === 1 ? "active" : "")}
                         onClick={()=>setAuth(1)}
                    >
                        <span>Sign Up</span>
                    </div>
                </div>
                <form className="login-form" style={{display: auth === 0 ? "flex" : "none"}}>
                    <input placeholder="Enter your email" name="email" type="text" />
                    <input placeholder="Enter your password" name="password" type="password" />
                    <button>Login</button>
                </form>
                <form className="signup-form" 
                    onSubmit={handleSubmit}
                    style={{display: auth === 1 ? "flex" : "none"}}>
                    <input placeholder="Enter your username" name="username" type="text" value={username} onChange={handleUsernameChange}/>
                    {usernameSt ? <span>Username exist!!</span> : null}
                    {isUsernameTyping && (
                        <>
                            {usernameValid ? (
                                <>
                                    {usernameSt ? <span>Username exist!!</span> :
                                        <span style={{ color: "green" }}>Username is valid</span>
                                    }
                                </>
                            ) : (
                                <span>
                                    Username muse be {'>'}= 6 length
                                </span>
                            )}
                        </>
                    )}
                    <input placeholder="Enter your email" name="email" type="text" value={email} onChange={handleEmailChange} />
                    {isEmailTyping && (
                        <>
                            {emailValid ? (
                                <>
                                    {emailSt ? <span>Email exist!!</span> :
                                        <span style={{ color: "green" }}>Email is valid</span>
                                    }
                                </>
                            ) : (
                                <span>
                                    Email must have @
                                </span>
                            )}
                        </>
                    )}
                    <input placeholder="Enter your password" name="password" type="password" value={password} onChange={handlePasswordChange}/>
                    {isPwTyping && (
                        <>
                            {passwordValid ? (
                                <span style={{ color: "green" }}>Password is valid</span>
                            ) : (
                                <span>
                                    Password must be {'>'}= 8 in length, have at least one capital letter and one special character.
                                </span>
                            )}
                        </>
                    )}
                    <button disabled={!(!emailSt && !usernameSt && usernameValid && emailValid && passwordValid)}>Sign Up</button>
                </form>

            </div>
        </div>
    );
}

export default Authentic;