import { useDispatch, useSelector } from "react-redux";
import { decrement, increment, power } from "./OperationReducer";

const Result = () => {
    const result = useSelector((state) => state.result);
    const dispatch = useDispatch();
    return(
        <div>
            <p>Redux Example</p>
            <p>Result is : <b>{result}</b></p>
            <input type="button" value="Increment" 
                    onClick={() => dispatch(increment())} />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" value="Decrement" 
                    onClick={() => dispatch(decrement())} /> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" value="Power" 
                    onClick={() => dispatch(power())} />

        </div>
    )
}

export default Result;