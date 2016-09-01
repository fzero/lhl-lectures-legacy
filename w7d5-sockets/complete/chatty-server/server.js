const express = require('express');
const SocketServer = require('ws').Server;
var uuid = require('node-uuid');

// Set the port to 4000
const PORT = 4000;

// Create a new express server
const server = express()
 // Make the express server serve static assets (html, javascript, css) from the /public folder
.use(express.static('public'))
.listen(
  PORT, '0.0.0.0', 'localhost',
  () => console.log(`Listening on ${ PORT }`)
);

// Create the WebSockets server
const wss = new SocketServer({server});

// Set up a callback that will run when a client connects to the server
// When a client connects they are assigned a socket, represented by
// the ws parameter in the callback.
wss.on('connection', (ws) => {
  console.log('Client connected');

  // Echo back messages (testing purposes)
  ws.on('message', receiveMessage);

  // Set up a callback for when a client closes the socket. This usually means they closed their browser.
  ws.on('close', () => console.log('Client disconnected'));
});

// Message handling methods
function receiveMessage(data) {
  let message = JSON.parse(data);
  message.id = uuid.v4();
  wss.broadcast(message);
  console.log(`User ${message.username || 'Anonymous'} said ${message.content}`);
}

// Broadcast - Goes through each client and sends message data
wss.broadcast = function(data) {
  wss.clients.forEach(function each(client) {
    client.send(JSON.stringify(data));
  });
};
