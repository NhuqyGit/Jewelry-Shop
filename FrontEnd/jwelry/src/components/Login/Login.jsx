import { useState } from "react";

function Login() {
    const [email, setEmail] = useState("")
    const [password, setPassword] = useState("")
    const [username, setUsername] = useState("")
    // const [password, setPassword] = useState("")
    return ( 
        <div className="login-container">
            <h1 style={{color: "red"}}>Login</h1>
            <form>
                <input placeholder="Enter your email" name="email" type="text" />
                <input placeholder="Enter your password" name="password" type="password" />

                <button>Login</button>
            </form>
        </div>
    );
}

export default Login;