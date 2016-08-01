// Load Express.js
var express = require('express')

// Create Express app
var app = express()

// Create web server with the Express app we just created
var server = require('http').createServer(app)

// Routes
app.get('/', function(req, res){
  res.send("Hello there!")
});

app.get('/name/:name', function(req, res){
  res.send(`Hello there, ${req.params.name}!`);
});

// Start server
console.log("Listening on port 4000");
server.listen(4000);
// Alternatively for Vagrant and/or to allow outside connections:
// server.listen(4000, "0.0.0.0");
