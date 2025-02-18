import {useEffect, useRef, useState} from "react";

const RefEx1 = () => {
    const[count,setCount]=useState(0)
    const prevCountRef = useRef();
    useEffect(() => {
        prevCountRef.current = count;
    }, [count])
    return(
        <div>
            <p>Prev Count : <b>{prevCountRef.current}</b></p>
            <p>Current Count : <b>{count}</b></p>
               <button onClick={() => setCount(count + 1)}>Increment</button>
        </div>
    )
}

export default RefEx1;