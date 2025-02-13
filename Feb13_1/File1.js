var fs = require("fs");

fs.writeFile("wipro1.txt","Wipro Dotnet Batch...Milestone a head",
    function(err) {
       if (err) throw err;
       console.log("File Created Successfully...");
    });