var express = require("express");
var app = express();

app.get("/combine/:firstname/:lastname", (req,res) => {
    const firstname = req.params.firstname;
    const lastname = req.params.lastname;
    let fullname = firstname + " " +lastname;
    res.send(fullname);
})

app.get("/display/:name/:city", (req, res) => {
    const name= req.params.name;
    const city = req.params.city;
    res.send("Hi " +name + " Living in " +city);
})

app.get("/show/:name", (req, res) => {
    const name = req.params.name;
    res.send("Hi Welcome to " +name);
})

app.get("/", (req, res) => {
    res.send("My First Service in Express JS...");
})

app.get("/keshav", (req,res) => {
    res.send("Hi I am Keshav from Wipro...");
})

app.get("/palak", (req, res) => {
    res.send("Hi I am Palak...");
})

app.listen(1111, (req, res) => {
    console.log("Node Js Application Started...");
})