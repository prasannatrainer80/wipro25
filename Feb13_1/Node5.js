var http = require("http")
var url = require("url");

http.createServer(function (req, resp) {
    resp.writeHead(200, {'Content-Type': 'text/html'});
    var q = url.parse(req.url,true).query;
    var txt = q.name + " " +q.city;
    resp.write(txt);
    resp.end("Welcome to Node Js...");
}).listen(8080);