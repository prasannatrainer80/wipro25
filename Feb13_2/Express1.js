var express = require("express")
var app = express();

app.get("/", (req, res) => {
    res.send("Welcome to Express JS Tutorial...");
})

app.listen(3000,() => {
    console.log("My First Program in Express Js Started");
})