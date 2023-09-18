import { useState } from "react";
import Axios from "axios";

function Insert() {
    // const [_type, setType] = useState("1")
    const [jewelry, setJew] = useState({
        jewName: "",
        idType: "1",
        idCol: "1",
        price: "",
        des: "",
        material: "",
        quantity: "",
        sizes: {
            size4: "",
            size5: "",
            size6: "",
            size7: "",
            size8: "",
            size9: "",
            size10: "",
        },
        images: []
    })
    
    
    const handleChangeSize = (e) => {
        const { name, value } = e.target;
        setJew((preJew) => ({
            ...preJew,
            sizes: {
              ...preJew.sizes,
              [name]: value
            }
          }));
    };

    const _renderSizes = (jewelry.idType !== "1" && jewelry.idType !== "5") ? <input placeholder="quantity" type="number" name="quantity" onChange={(e)=>handleChange(e)}/> : (
        jewelry.idType === "1" ? 
        Object.keys(jewelry.sizes).map((size)=>(
            <input
                key={size}
                placeholder={`Input ${size}`}
                type="number"
                name={size}
                value={jewelry.sizes[size]}
                onChange={(e) => handleChangeSize(e)}
            />
        )) :
        (
            <>
                <input
                    placeholder="Input size9"
                    type="number"
                    name="size9"
                    value={jewelry.sizes.size9}
                    onChange={(e)=>handleChangeSize(e)}
                />
                <input
                    placeholder="Input size10"
                    type="number"
                    name="size10"
                    value={jewelry.sizes.size10}
                    onChange={(e)=>handleChangeSize(e)}
                />
            </>
        )
    )

    const handleChange = (e)=>{
        const {name, value} = e.target;
        setJew((preJew)=>({...preJew, [name]: value}))
    }

    const handleChangeType = (e)=>{
        const {name, value} = e.target;
        setJew((preJew)=>({...preJew, [name]: value, quantity: "", sizes:{
            size4: "",
            size5: "",
            size6: "",
            size7: "",
            size8: "",
            size9: "",
            size10: "",
        }}))
    }

    const handleImageChange = (e)=>{
        const files = e.target.files;
        const l = []

        for (let i = 0; i < files.length; i++) {
            console.log(files[i])
            // const fileName = files[i].name;
            l.push(files[i]);
        }

        setJew((preJew)=>({...preJew, images: l}))
    }

    const handleSubmit = (e) => {
        e.preventDefault();
        if(jewelry.jewName === "" || jewelry.price === "" || jewelry.des === ""){
            return;
        }
        if (jewelry.idType === "1" || jewelry.idType === "5"){
            const isSizesNull = Object.keys(jewelry.sizes).every((size)=> jewelry.sizes[size] === "");
            console.log("size: ", isSizesNull)
            if(isSizesNull){
                return;
            }
        }
        else if(jewelry.quantity === ""){
            return;
        }

        const formData = new FormData();
        formData.append("jewelryData", JSON.stringify(jewelry));
        // Bổ sung danh sách các tệp ảnh vào formData

        for (const file of jewelry.images) {
            formData.append("images", file);
        }
        
        
        Axios.post("http://127.0.0.1:8080/insert", formData, {
            headers: {
                "Content-Type": "multipart/form-data",
            },
        })
        .then((res) => {
            // Xử lý khi post thành công
            console.log("JSON đã được post thành công.");
            console.log(res.data); // In thông báo xác nhận từ server
        })
        .catch((error) => {
            // Xử lý khi post thất bại
            console.error("Lỗi khi post JSON:", error);
            if (error.response) {
                console.error("Phản hồi từ server:", error.response.data);
            }
        });
        // Kiểm tra nếu tất cả các size đều là null, thì không thực hiện action
        // const isAllNull = Object.values(sizes).every((size) => size === null);
        
        // if (!isAllNull && (_type === "1" || _type==="5")) {
        // // Thực hiện action ở đây
            
        // }
    }

    console.log(jewelry) 
    return ( 
        <>
            <form onSubmit={handleSubmit}>
                <input onChange={(e)=>handleChange(e)} placeholder="jewelry name" type="text" name="jewName" required/>
                <select name="collection">
                    <option value="1">Glint-Crack</option>
                    <option value="2">Baroque</option>
                    <option value="3">Bloody Hearts</option>
                    <option value="4">Lauris</option>
                    <option value="5">Fenix</option>
                    <option value="6">Flower</option>
                </select>
                <select name="idType" onChange={(e)=>handleChangeType(e)}>
                    <option value="1">Ring</option>
                    <option value="2">Glasses</option>
                    <option value="3">Necklace</option>
                    <option value="4">Bracelet</option>
                    <option value="5">Earrings</option>
                </select>
                {_renderSizes}
                <input onChange={(e)=>handleChange(e)} placeholder="price" type="number" name="price" required/>
                <input onChange={(e)=>handleChange(e)} placeholder="des" type="text" name="des" required/>
                <input onChange={(e)=>handleChange(e)} placeholder="material" type="text" name="material" required/>
                <input onChange={(e)=>handleImageChange(e)} placeholder="image" type="file" name="images" multiple required/>
                <input type="submit" />
            </form>
        </>
    );
}

export default Insert;