require 'json'
require 'net/https'


TOKEN = ENV["TELEGRAM_BOT"]

Handler = Proc.new do |req, res|

	mensaje = "holaaa"

	vuelta = mensaje

	res.status = 200
	res['Content-Type'] = 'text/text; charset=utf-8'
	res.body = vuelta
end