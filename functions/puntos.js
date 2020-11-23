const info = require('./info.json');


async function calcularPuntos(nombre){
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

exports.handler = async function (event, context){
	
	try{

		let body = JSON.parse(event.body);
		let {chat, text} = body.message;
		let cadena = ""; 

		console.log(text);

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
			cadena += "También puedes probar con /puntosBilal , /puntosMario y /puntosRaúl";
		}
		

		return {
			statusCode: 200,
			body: JSON.stringify({text: cadena, method: 'sendMessage', chat_id:chat.id}),
			headers:{
				'Content-Type': 'application/json'
			}
		};

	}

	catch(error){
		console.log(error);
	}
}

