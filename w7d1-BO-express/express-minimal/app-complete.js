// Load Express.js
var express = require('express')
var bodyParser = require('body-parser')

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

// Load bodyParser to handle form POSTs and JSON
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

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

app.get('/form', function(req, res){
  res.send(`
    <form action="/name" method="post">
      <input type="text" name="name">
      <input type="submit" value="go">
    </form>
  `);
});

app.post('/name', function(req, res){
  console.log("--- Name was " + req.body.name);
});

// Start server
console.log("Listening on port 4000");
server.listen(4000);
// Alternatively for Vagrant and/or to allow outside connections:
// server.listen(4000, "0.0.0.0");
