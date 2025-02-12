import { Employ } from "./Employ";

const employs = [
    new Employ(1, "Keshav",88234),
    new Employ(2,"Rajesh",88234),
    new Employ(3, "Arthy",82245),
    new Employ(4, "Rajesh",88222)
];

employs.forEach(x => {
    console.log(x.empno + " " +x.name + " " +x.salary);
})