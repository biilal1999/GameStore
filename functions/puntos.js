const request = require('request-promise');
const info = require('./info.json');


Function calculaPuntos(cliente){

}

exports.handler = async function (event, context){
	let body = JSON.parse(event.body);
	let {chat, msg} = body.message;

	if (msg == "/puntos"){
		cadena = "¿Bilal? ¿JJ? ¿Mario? ¿Raúl? ¿Qué clientes quieres consultar?";
		cadnena += "\n";
		cadena = "Por ejemplo, /puntosBilal";
	}

	else{
		cadena = "eeey";
	}
	

	return {
		statusCode: 200,
		body: JSON.stringify({text: cadena, method: 'sendMessage', chat_id:chat.id}),
		headers:{
			'Content-Type': 'application/json'
		}
	};
}

