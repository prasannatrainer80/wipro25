import { createStore } from "redux";
import OperationReducer from "./OperationReducer";

const store = createStore(OperationReducer) 

export default store;