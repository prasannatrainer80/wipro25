import axios from "axios";
import React, { useState } from "react";

const Service2 = () => {

    const[userResult, setUserResult] = useState({})
    const[userId,setUserId] = useState(0)

    const handleChange = event => setUserId(event.target.value);
    
    const showResult = () => {
        // alert("Hi");
        let id = parseInt(userId);
        // alert(id);
        axios.get("https://jsonplaceholder.typicode.com/users/"+id) 
        .then(response => {
            setUserResult(response.data);
        })
    }
    return(
        <div>
            <form>
                User Id : 
                <input type="number" name="userId" 
                    value={userId} 
                    onChange={handleChange} /> <br/><br/>
                <input type="button" value="Search" 
                    onClick={showResult} /> <br/>
                <hr/>
                <p>User Id : {userResult.id}</p>
                <p>User Name : {userResult.name}</p>
                <p>User Name : {userResult.username}</p>
                <p>Email : {userResult.email}</p>
                <p>Phone : {userResult.phone}</p>
            </form>
        </div>
     )
}

export default Service2;