import React, { useState } from "react";

function Fc4() {
    const[sname,setSname] = useState('')
 return(
    <div>
        <p>Default Value is : <b> {sname} </b></p>
        <p>
            <input type="button" value="Pavan" 
                onClick={() =>setSname("Hi I am Pavan")} />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" value="Koushik" 
                onClick={() => setSname("Hi I am Koushik")} /> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" value="Keshav" 
                onClick={() => setSname("Hi I am Keshav...")} />
        </p>
    </div>
 )
}

// const Fc4 = () => {

//     const[sname, setSname] = useState('') 

//     return(

//     )

// }

export default Fc4;