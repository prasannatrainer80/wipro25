var http = require("http")

http.createServer(function (req, resp) {
    resp.writeHead(200, {'Content-Type': 'text/html'});
    resp.end("Welcome to Node Js...");
}).listen(8080);