var http = require("http");
var welcome = require("./Welcome")

http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write(welcome.hello());
    res.end();
}).listen(8181);