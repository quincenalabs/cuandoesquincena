export default function  ajax(url, method, data = {}) {
  return new Promise(function (resolve, reject) {
    var xhr = new XMLHttpRequest();
    xhr.open(method, url);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify(data));

    xhr.onreadystatechange = () => {
      if (xhr.readyState == XMLHttpRequest.DONE ) {
	if (xhr.status == 200) {
	  let payload = JSON.parse(xhr.responseText);
	  resolve(payload);
	}else{
	  reject(xhr.responseText);
	}
      }
    };
  });
}
