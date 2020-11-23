const request = require('request-promise');
const info = require('./info.json');


	exports.handler = async function (event, context){
		try{
			let body = JSON.parse(event.body);
			let {chat, text} = body.message;
			console.log(body.message);

			let cadena = "eeey";

			return {
				statusCode: 200,
				body: JSON.stringify({text: cadena, method: 'sendMessage', chat_id:chat.id}),
				headers:{
					'Content-Type': 'application/json'
				}
			};
		}

		catch(error){
		}
	}

