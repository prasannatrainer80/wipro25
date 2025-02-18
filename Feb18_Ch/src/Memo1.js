import { useMemo, useState } from "react";

const Memo1 = () => {

    const [number,setNumber] = useState(0);
    const squareNum = useMemo(() => squareNumber(number), [number]); 
    // const[count,setCount]=useState(0);
    
    const onChangeHandler = (e) => {
        setNumber(e.target.value);
    }

    function squareNumber(n) {
        return Math.pow(n,2);
    }

    return(
        <div>
            <h1>Use Memo Example</h1>
            <input type="number" value={number} 
            onChange={onChangeHandler} />
            <p>Result : {squareNum}</p>
        </div>
    )
}

export default Memo1;