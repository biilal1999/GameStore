require 'json'
require 'net/https'


TOKEN = ENV["TELEGRAM_BOT"]

Handler = Proc.new do |req, res|

	mensaje = "holaaa"
	recibo = JSON.parse(req.body)
	id = recibo["message"]["chat"]["id"]

	vuelta = {msg: mensaje, chat: id}
	url = "https://api.telegram.org"
	uri = URI(url)

	res.status = 200
	res['Content-Type'] = 'application/json; charset=utf-8'
	res.body = vuelta.to_json
	
	return { statusCode: 200 }
	
end
