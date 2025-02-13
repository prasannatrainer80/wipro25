var fs = require("fs");

fs.appendFile("wipro1.txt","this is new content...Prasanna Trainer ",
    function(err) {
       if (err) throw err;
       console.log("File data Added Successfully...");
    });