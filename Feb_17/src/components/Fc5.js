import React, { useState } from "react";

const Fc5 = () => {

    const[message, setMessage] = useState("Good Mornining");
    const handleChange = event => setMessage(event.target.value);
    return(
        <div>
            Default Message is : <b> {message} </b> <br/>
            <p>
                Updated Message is : 
                <input type="text" value={message} onChange={handleChange} />
            </p>
            {/* <input type="button" value="Update Message" 
            onClick={() => handleChange()} /> */}
        </div>
    )
}

export default Fc5;