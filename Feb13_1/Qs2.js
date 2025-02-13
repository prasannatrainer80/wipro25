var http = require("http");
var url = require("url");

http.createServer(function (req, resp) {
    resp.writeHead(200, {'Content-Type': 'text/html'});
    var q = url.parse(req.url,true).query;
    var result = q.firstName + " " +q.lastName;
    resp.write(result);
    // resp.end("Welcome to Node Js...");
}).listen(8080);