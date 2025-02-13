var http = require("http");
var nam = require("./VarEx");

http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write(nam.show("Raj","Kishore"));
    res.end();
}).listen(8282);