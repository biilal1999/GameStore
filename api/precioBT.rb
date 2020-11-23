require 'json'
require 'net/https'


TOKEN = ENV["TELEGRAM_BOT"]

Handler = Proc.new do |req, res|

	mensaje = "holaaa"

	res.status = 200
	res['Content-Type'] = 'application/json; charset=utf-8'
	res.body = mensaje.to_json
end
