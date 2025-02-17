import { useContext } from "react";
import {ThemeContext} from '../context/ThemeContext'

const ButtonEx = () => {
    const theme = useContext(ThemeContext);
    return(
        <div>
           <button style={{backgroundColor:theme.background,color: theme.text}}>Hello</button>
        </div>
    )
}

export default ButtonEx;