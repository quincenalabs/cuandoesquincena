// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".

import "phoenix_html";


// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"


let message = document.getElementById("silly-message");

function pollMessage() {
  var xmlhttp = new XMLHttpRequest();

  message.className = `silly-message animated fadeOut`;

  xmlhttp.onreadystatechange = function() {
    if (xmlhttp.readyState == XMLHttpRequest.DONE ) {
      if (xmlhttp.status == 200) {
	let payload = JSON.parse(xmlhttp.responseText);


	setTimeout(function(){
	  message.className = `silly-message animated fadeIn`;
	  message.innerText = payload.data.message;
	}, 1000);
      }
    }
  };

  xmlhttp.open("GET", "/silly", true);
  xmlhttp.send();
}


setInterval(pollMessage, 5000);

pollMessage();
