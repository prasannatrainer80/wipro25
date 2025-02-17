import React, { useState } from "react";

const Fc6 = () => {

    const[data, setState] =useState({
        firstName : '',
        lastName : '',
        fullName : ''
    })

    // const changeFirstName = event => setState(event.target.value);
    // const changeLastName = event => setState(event.target.value);

    const handleChange = event => {
        setState({
            ...data,[event.target.name]:event.target.value
        })
    }

    const show = () => {
        let res = data.firstName + " " +data.lastName;
        console.log(data.firstName);
        console.log(data.lastName);
        setState({
            fullName : res
        })
    }
    
    return(
        <div>
            <form>
                <p>
                    First Name : 
                    <input type="text" name="firstName" 
                        value={data.firstName} onChange={handleChange} /> <br/><br/>
                    Last Name : 
                    <input type="text" name="lastName" 
                        value={data.lastName} onChange={handleChange} /> <br/><br/>
                    Full Name : 
                    <input type="text" name="fullName" 
                        value={data.fullName} /> <br/><br/> 
                    <input type="button" value="Show" onClick={show} />
                </p>
            </form>
        </div>
    )
}

export default Fc6;