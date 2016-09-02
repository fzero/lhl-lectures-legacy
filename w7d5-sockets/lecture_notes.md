# Websockets!

Today we played with WebSockets using a very minimalistic approach. We've started with something super bare-bones - just sending messages to the server and broadcasting them back to the client - and then we've added WebSockets to a chat application in written in React.

* Client-side
  * Just use the native WebSocket API (no need for socket.io these days) -  https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_client_applications
* Server-side
  * Use the bare-bones `ws` package - https://github.com/websockets/ws
  * It's pretty close to the browser implementation of sockets
