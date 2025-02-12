import { Test } from "./Test";

class Ts8 {
    constructor(private _test : Test){

    }
    
    show = () => {
        console.log(this._test.sum(12,45));
        console.log(this._test.sub(12,45));
        console.log(this._test.mult(12,5));
    }

}