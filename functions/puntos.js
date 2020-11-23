const info = require('./info.json');


exports.handler = async function (event, context){
	let body = JSON.parse(event.body);
	let {chat, text} = body.message;
	let cadena = ""; 

	console.log(text);

	if (text == "/puntos"){
		cadena = "¿Bilal? ¿JJ? ¿Mario? ¿Raúl? ¿Qué clientes quieres consultar?";
		cadnena += "\n";
		cadena += "Por ejemplo, /puntosBilal";
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

