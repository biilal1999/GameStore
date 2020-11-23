require 'json'
require 'net/https'


TOKEN = ENV["TELEGRAM_BOT"]

Handler = Proc.new do |req, res|

	mensaje = "holaaa"
	recibo = JSON.parse(req.body)
	id = recibo["message"]["chat"]["id"]
	vuelta = {text: mensaje, chat_id: id}
	res.status = 200
	res['Content-Type'] = 'application/json; charset=utf-8'
	res.body = vuelta.to_json
end
