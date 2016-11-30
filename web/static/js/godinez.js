import React from "react";
import ReactDOM from "react-dom";
import ajax from './ajax';

function toggleWall() {
  let godinezWall = document.getElementById("godinez-wall");

  if((godinezWall.getAttribute("state") === "closed")){
    godinezWall.className="animated fadeInUp";
    godinezWall.setAttribute("state", "open");
    godinezWall.style.visibility = 'visible';
  }else{
    godinezWall.className="animated fadeOutDown";
    godinezWall.setAttribute("state", "closed");

    setTimeout(()=>{
      godinezWall.style.visibility = 'hidden';
      godinezWall.className="";
    }, 500);
  }
};


let godinezNewsButtons = Array.from(document.getElementsByClassName('godinez-button'));

godinezNewsButtons.forEach((button)=>{
  button.addEventListener("click", toggleWall);
});

class MessageInput extends React.Component {

}

class SillyMessageRow extends React.Component {

  render(){
    let message = this.props.children.m.message;
    let votes = this.props.children.m.votes;
    let approved = this.props.children.m.approved ? "bg-success" : "bg-warning";

    return(
	<div className={"row message-row "+approved}>
	<div className="col-md-1"></div>
	<div className="col-md-2">{votes}</div>
	<div className="col-md-6">
	  {message}
	</div>
	<div className="col-md-2" onClick={this.props.upVote(this.props.children.m)}>Votar</div>
      </div>
    );
  }
}

class GodinezFeed extends React.Component {
  constructor(props) {
    super(props);

    this.state = {messages: []};
    this.loadMessages = this.loadMessages.bind(this);
    this.addMessage = this.addMessage.bind(this);
    this.upVote = this.upVote.bind(this);
    this.loadMessages();
  }

  loadMessages(){
    ajax("/silly_messages", "GET").then((response)=>{
      this.setState({messages: response.data});
    });
  }

  addMessage(message){
    ajax("/silly_messages", "POST", {message: message}).then((response)=>{
      this.loadMessages();
    });
  }

  upVote(message){
    console.log(message);
  }

  render(){
    let rows = this.state.messages.map((m)=> {
      return <SillyMessageRow upVote={this.upVote} key={m.id}>{{m}}</SillyMessageRow>;
    });

    return(<div>
	   <h3>Silly wall</h3>
	   {rows}
	   </div>);
  }
}

ReactDOM.render(
    <GodinezFeed/>,
  document.getElementById('godinez-app')
);
