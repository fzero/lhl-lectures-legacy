// Load Express.js
var express = require('express')

// Create Express app
var app = express()

// Create web server with the Express app we just created
var server = require('http').createServer(app)

// Add some logging using a custom middleware
app.use(function (req, res, next) {
  var now = (new Date()).toISOString();
  console.log("%s - %s %s", now, req.method, req.originalUrl);
  next()
});

// Routes
app.get('/bodymovin', function(req, res){
  res.send("We're getting down computer action")
});

app.get('/sabotage', function(req, res){
  res.redirect('https://www.youtube.com/watch?v=z5rRZdiu1UE');
})

app.get('/sleep/:seconds', function(req, res){
  var seconds = Number(req.params.seconds)
  var sleep_how_much = seconds > 0 ? "Sleep! " + seconds + "!" : "No! Sleep!"
  setTimeout(function(){
    res.send(sleep_how_much + " Til Brooklyn!")
  }, seconds * 1000)
});

// Start server
server.listen(4000)
