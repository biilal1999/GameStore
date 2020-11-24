// Importamos el archivo .json

const info = require('./info.json');							


// Función que te busca los puntos de un usuario concreto 

function calcularPuntos(nombre){  										
	var encontrado = false;
	cadena = ""
	let suma = 0;

	for (let i = 0; i < info["clientes"].length && !encontrado; i++){
		if (info["clientes"][i]["nombre"] == nombre){
			for (let j = 0; j < info["clientes"][i]["videojuegosComprados"].length; j++){
				suma += info["clientes"][i]["videojuegosComprados"][j]["puntos"];
			}

			encontrado = true
		}
	}

	
	if (encontrado){
		cadena = "El cliente " + nombre + " tiene " + suma + " puntos acumulados.";
	}

	else{
		cadena = "No existe el cliente " + nombre;
	}

	
	return cadena;			

}


exports.handler = async function (event){

	// Obtenemos el cuerpo del mensaje, y lo separamos en el chat y en el texto enviado
	let body = JSON.parse(event.body);
	let {chat, text} = body.message;
	let cadena = ""; 

	// Establecemos casos para cada comando enviado

	if (text == "/puntos"){
		cadena = "¿Bilal? ¿JJ? ¿Mario? ¿Raúl? ¿Qué clientes quieres consultar?";
		cadena += "\n";
		cadena += "Por ejemplo, /puntosBilal";
	}

	else if (text == "/puntosBilal"){
		cadena = calcularPuntos("Bilal");
	}

	else if (text == "/puntosJJ"){
		cadena = calcularPuntos("JJ");
	}

	else if (text == "/puntosMario"){
		cadena = calcularPuntos("Mario");
	}

	else if (text == "/puntosRaúl" || text == "/puntosRaul"){
		cadena = calcularPuntos("Raúl");
	}

	else{
		cadena = "Para usar el bot PUNTOS utilice el comando /puntos.";
		cadena += "\n"
		cadena += "Por ejemplo, /puntosJJ para saber los puntos que tiene acumulados JJ";
		cadena += "\n"
		cadena += "También puedes probar con: \n";
		cadena += "---> /puntosBilal";
		cadena += "\n";
		cadena += "---> /puntosMario";
		cadena += "\n";
		cadena += "---> /puntosRaul";
	}
		

	// A devolver en Netlify expecificando el texto, el chat y el método
	return {
		statusCode: 200,
		body: JSON.stringify({text: cadena, method: 'sendMessage', chat_id:chat.id}),
		headers:{
			'Content-Type': 'application/json'
		}
	};

}

