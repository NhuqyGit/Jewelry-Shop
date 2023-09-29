import { useParams } from "react-router-dom";
import "./Footer.scss"
import logo from "../../assets/footer_icon_star.png"

function Footer() {
    const _path = useParams()["*"]
    return ( 
        <footer>
            <div className="footer-container" style={_path === "collection" || _path === "jewelry" ? {border: "none", backgroundImage: "none"} : {borderTop: "1px solid #fff"}}>
                <div className="footer-content">
                    <a className="footer-logo" href="/">
                        <img src={logo} alt=""></img>
                        <span>2023 _____ NHUQYLO</span>
                    </a>
                    
                    <div className="footer-social">
                        <ul>
                            <li><a href="#">TikTok</a></li>
                            <li><a href="#">Twitter</a></li>
                            <li><a href="#">Facebook</a></li>
                            <li><a href="#">Instagram</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
     );
}

export default Footer;