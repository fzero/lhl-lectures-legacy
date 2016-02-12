var express = require('express');
var app = express();
var server = require('http').createServer(app);
var io = require('socket.io')(server);

app.get('/', function(req, res, next) {
  res.sendFile(__dirname + '/index.html');
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
