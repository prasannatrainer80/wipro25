import React, { useState } from "react";

const Fc3 = () => {
    const[count,setCount] = useState(0) 

    return(
        <div>
            <p>Default Value is : {count}</p>
            <p>
                <input type="button" value="Increment" 
                    onClick={() => setCount(count+1)} /> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" value="Decrement" 
                    onClick={() => setCount(count-1)} />
            </p>
        </div>
    )
}

export default Fc3;