import React, {Component} from 'react';
import MessageList from './MessageList.jsx';
import ChatBar from './ChatBar.jsx';

const App = React.createClass({
  getInitialState: function() {
    return {
      data: {
        currentUser: {name: undefined},
        messages: []
      }
    }
  },

  componentDidMount: function() {
    // Connect to the websocket server
    this.socket = new WebSocket("ws://localhost:4000");
    // Receive and process message
    this.socket.onmessage = function(event) {
      var message = JSON.parse(event.data);
      this.addMessage(message);
    }.bind(this);
  },

  addMessage: function(new_message) {
    var messages = this.state.data.messages;

    // Send message via socket as stringified JSON
    this.state.data.messages.push(new_message);
    this.setState({data: this.state.data});
  },

  sendMessage: function(new_message) {
    var messages = this.state.data.messages;
    new_message.username = this.state.data.currentUser.name;

    // Send message via socket as stringified JSON
    this.socket.send(JSON.stringify(new_message));
  },

  setUser: function(new_user) {
    this.state.data.currentUser.name = new_user;
    this.setState({data: this.state.data});
  },

  render: function() {
    var data = this.state.data;
    return (
      <div>
        <MessageList
          messages={data.messages}
        />
        <ChatBar
          currentUser={data.currentUser.name}
          messageCallback={this.sendMessage}
          userCallback={this.setUser}
        />
      </div>
    );
  }
});
export default App;
