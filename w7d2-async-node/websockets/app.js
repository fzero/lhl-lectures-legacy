// Load Express.js + libraries
var express = require('express');
var serveStatic = require('serve-static');
var bodyParser = require('body-parser');
var app = express();

// App middleware:
app.use(serveStatic(__dirname + '/public'));      // Serve static files from /public
app.use(bodyParser.urlencoded({extended: true})); // bodyParser handles form data in POST requests
app.use(bodyParser.json());                       // and also JSON
app.set('views', __dirname + '/views');           // Configure EJS to look for templates inside /views
app.set('view engine', 'ejs');                    // Use EJS as the template engine

// Create web server with the Express app we just created
var server = require('http').createServer(app);

// Add websockets support
var io = require('socket.io')(server);


// THE FUN STARTS BELOW!


// Regular Express.js 'get' route
// This uses EJS to render the view (see /views/test.ejs)
app.get('/test', function(req, res) {
  var data = {
    name: "Fabio",
    location: "Lighthouse"
  }
  res.render('test', data);
});


// Socket.io handlers
// Everything is based on events specified on the first parameter ('connection',
// 'join', 'messages', 'broad') with some data attached.
io.on('connection', function(client) {
  console.log('Client connected...');

  // Ping the client on connect
  client.on('join', function(data) {
    console.log(data);
    client.emit('special', {color: '#ff0000', message: 'You are connected!'});
  });

  // Chat message event!
  client.on('messages', function(data) {
    // First send the message back to whoever wrote the message...
    client.emit('broad', data);
    // ...then send the message to all connected clients.
    client.broadcast.emit('broad', data);
  });
});


// Start the server
console.log("Listening on port 4000");
server.listen(4000);
