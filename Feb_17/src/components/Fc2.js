import React, { useState } from "react";

const Fc2 = () => {
    const [count,setCount]=useState(5)
    const [sname,setSname] = useState("Sudipta")
    const [city,setCity] = useState("Delhi") 

    return(
        <div>
            Default Count is : <b>{count}</b>
            <br/>
            Student Name is : <b>{sname}</b>
            <br/>
            Student City is : <b>{city}</b>
        </div>
    )
}
export default Fc2;