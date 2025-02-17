import axios from "axios";
import React, { useEffect, useState } from "react";

const Service1 = () => {
  const[users, setUserData] = useState([])

  useEffect(() => {
    const fetchData = async() => {
        const response = await axios.get("https://jsonplaceholder.typicode.com/users");
        setUserData(response.data);
    }
    fetchData()
  },[])
  return(
    <div>
        <table border="3" align="center">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>UserName</th>
                <th>Email</th>
                <th>phone</th>
            </tr>
            {users.map((user) => 
                <tr>
                    <td>{user.id}</td>
                    <td>{user.name}</td>
                    <td>{user.username}</td>
                    <td>{user.email}</td>
                    <td>{user.phone}</td>
                </tr>
            )}
        </table>
    </div>
  )
}

export default Service1;