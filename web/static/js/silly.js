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


setInterval(pollMessage, 10000);

pollMessage();
