require 'json'
require 'net/https'


TOKEN = ENV["TELEGRAM_BOT"]

Handler = Proc.new do |req, res|

	mensaje = "holaaa"
	recibo = JSON.parse(req.body)
	id = recibo["message"]["chat"]["id"]

	vuelta = {msg: mensaje, chat: id}

	res.status = 200
	res['Content-Type'] = 'text/text; charset=utf-8'
	res.body = vuelta.to_json
	res = Net::HTTP::Get.new("https://api.telegram.org/bot#{TOKEN}/sendMessage")
end
