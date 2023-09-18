import { Outlet } from "react-router-dom";
import "./Admin.scss"
function Admin() {
    return ( 
        <div className="admin">
            <div className="admin-container">
                <div>Admin</div>
                <Outlet />
            </div>
        </div>
     );
}

export default Admin;