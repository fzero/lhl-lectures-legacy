// Load Express.js
var express = require('express');
var serveStatic = require('serve-static');
var bodyParser = require('body-parser');
var app = express();

// App middleware
app.use(serveStatic(__dirname + '/public'));
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');

// Start web server with the Express app we just created
var server = require('http').createServer(app);

// Websockets support
var io = require('socket.io')(server);

app.get('/test', function(req, res) {
  var data = {
    name: "Fabio",
    location: "Lighthouse"
  }
  res.render('test', data);
});

io.on('connection', function(client) {
  console.log('Client connected...');

  client.on('join', function(data) {
    console.log(data);
    client.emit('messages', 'Hello from server!');
    client.emit('banana', 'Fabio');
  });

  client.on('messages', function(data) {
    client.emit('broad', data);
    client.broadcast.emit('broad', data);
  });
});

server.listen(4000);

