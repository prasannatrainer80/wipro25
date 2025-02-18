import { createStore } from "redux";
import NameReducer from "./NameReducer";

const store = createStore(NameReducer)
export default store;