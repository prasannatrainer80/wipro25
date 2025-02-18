import { useDispatch, useSelector } from "react-redux";
import { chandu, charan, keshav } from "./NameReducer";

const ButtonEx = () => {

    const sname = useSelector((state) => state.sname);
    const dispatch = useDispatch();
    return (
        <div>
            Hello
            <p><b>Name is : {sname}</b></p>
            <button onClick={() => dispatch(keshav())}>Keshav</button>
        <button onClick={() => dispatch(chandu())}>Chandu</button>
        <button onClick={() => dispatch(charan())}>Charan</button>
        </div>
    )
}

export default ButtonEx;