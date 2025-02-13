var http = require("http");
var greet = require("./Greeting");

http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write(greet.greets());
    res.end();
}).listen(8282);