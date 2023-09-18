import "./Card.scss"

function Card({jew}) {
    const sevPath="http://127.0.0.1:8080/"
    const priceFormat = new Intl.NumberFormat('en-DE').format(jew.price) + " vnđ"
    return ( 
        <a className="card" href={"product/" + jew.idJew}>
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