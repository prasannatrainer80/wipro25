import { useMemo, useState } from "react";

const Memo2 = () => {
    const[name,setName] = useState("Welcome to React");

    const lc = useMemo(() => lowerCase(name),[name]);
    const uc = useMemo(() => upperCase(name, [name]));

    const OnNameChanger = (e) => {
        setName(e.target.value)
    }
    function lowerCase(name) {
        return name.toLowerCase();
    }
    function upperCase(name) {
        return name.toUpperCase();
    }
    return(
        <div>
            <p>UseMemo Example</p>
            Default Name : 
            <input type="text" value={name} 
                onChange={OnNameChanger} /> 
            <p>{lc}</p>
            <p>{uc}</p>
        </div>
    )
}

export default Memo2;