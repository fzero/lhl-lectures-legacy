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
    console.log("componentDidMount <App />");
  },

  addMessage: function(new_message) {
    var messages = this.state.data.messages;
    new_message.id = messages.length; // Which is always index + 1!
    new_message.username = this.state.data.currentUser.name;

    this.state.data.messages.push(new_message);
    this.setState({data: this.state.data});
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
          messageCallback={this.addMessage}
          userCallback={this.setUser}
        />
      </div>
    );
  }
});
export default App;
