"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var Employ_1 = require("./Employ");
var employs = [
    new Employ_1.Employ(1, "Keshav", 88234),
    new Employ_1.Employ(2, "Rajesh", 88234),
    new Employ_1.Employ(3, "Arthy", 82245),
    new Employ_1.Employ(4, "Rajesh", 88222)
];
employs.forEach(function (x) {
    console.log(x.empno + " " + x.name + " " + x.salary);
});
