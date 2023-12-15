import "./Card.scss"
import { URL_FE, URL_BE } from "../../../url/url";

function Card({jew}) {
    const sevPath=URL_BE
    const priceFormat = new Intl.NumberFormat('en-DE').format(jew.price) + " vnđ"
    return ( 
        <a className="card" href={`${URL_FE}/product/${jew.idJew}`}>
            <div className="card-image">
                <img src={sevPath + jew.images[0]} alt="" />
            </div>
            <div className="card-details">
                <h4 className="name">{jew.jewName}</h4>
                <h4 className="price">{priceFormat}</h4>
            </div>
        </a>
     );
}

export default Card;