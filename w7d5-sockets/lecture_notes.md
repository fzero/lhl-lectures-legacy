# Websockets!

Today we played with WebSockets using a very minimalistic approach. We've started with something super bare-bones - just sending messages to the server and broadcasting them back to the client - and then we've added WebSockets to a chat application in written in React.

* Client-side
  * Just use the native [WebSocket API](https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_client_applications) (no need for socket.io these days)
* Server-side
  * Use the bare-bones `ws` package - https://github.com/websockets/ws
  * It's pretty close to the browser implementation of sockets

Here's the [code discussed in class](https://www.dropbox.com/s/ut4oaxd1skwrlsj/w7d5-websockets-react.tgz?dl=1).
Once you unzip it you'll see a folder `complete` containing two other folders:
  - `/chatty`: the client app in React built with webpack. `npm install` it and `npm start` it. Runs on port 3000.
  - `/chatty-server`: the websocket server. Same as above. Runs on port 4000.

React applications need a fair amount of tooling to be built. These days most people use [Webpack](https://webpack.github.io/), but it's famous for having **the worst documentation ever** while requiring a fair amount of configuration.
To make things easier, we at Lighthouse created a [nice React boilerplate](https://github.com/lighthouse-labs/react-simple-boilerplate) you can use for your own projects. You can thank us later!
