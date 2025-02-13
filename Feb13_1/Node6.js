var http = require("http");
var dt = require("./DateTime")

http.createServer(function (req, resp) {
    resp.writeHead(200, {'Content-Type': 'text/html'});
    resp.write(dt.myDateTime());
    // resp.end("Welcome to Node Js...");
}).listen(8282);