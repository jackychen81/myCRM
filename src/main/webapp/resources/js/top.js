var _socket;
function getCon(url){
	var socket = new SockJS(url);
	_socket = socket;
	return socket;
}

function getSocket(){
	return _socket;
}



		
		
