
const initialState = {
    result : 0
}
const OperationReducer = (state = initialState, action) => {
    switch(action.type) {
        case 'INCREMENT' : 
            return {...state, result : state.result + 1};
        case 'DECREMENT' :
            return {...state, result : state.result -1};
        case 'POWER' :
            return {...state, result : Math.pow(state.result,2)};
        default : 
            return state;
    }
}

export const increment = () => ({type : 'INCREMENT'});
export const decrement = () => ({type : 'DECREMENT'});
export const power = () => ({type : 'POWER'});

export default OperationReducer;