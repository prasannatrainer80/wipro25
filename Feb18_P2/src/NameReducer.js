const initialState = {
    sname : ''
}

const NamesReducer = (state = initialState, action) => {
   
    switch (action.type) {
        case 'KESHAV':
            // alert(state.sname);
            return { ...state, sname: 'Hi I am Keshav' };
           
        case 'CHARAN':
            return { ...state, sname: 'Hi I am Charan' };
        case 'CHANDU':
                return { ...state, sname: 'Hi I am Chandu' };
    
        default:
            return state;
    }
}
export const keshav = () => ({ type: 'KESHAV' });
export const charan = () => ({ type: 'CHARAN' });
export const chandu = () => ({type : 'CHANDU'});

export default NamesReducer;

