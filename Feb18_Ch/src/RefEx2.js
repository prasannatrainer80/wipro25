import { useRef } from "react";

const RefEx2 = () => {
    
    const data = useRef();

    const focusInput = () => {
        data.current.focus();
    }

    return(
        <div>
            <input type="text" ref={data} /> <br/>
            <input type="button" onClick={focusInput} value="Show" />
        </div>
    )
}

export default RefEx2;