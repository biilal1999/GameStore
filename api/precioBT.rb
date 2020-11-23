require 'json'
require 'net/https'


TOKEN = process.env.TELEGRAM_BOT

Handler = Proc.new do |req, res|

	res.status = 200
	res['Content-Type'] = 'text/text; charset=utf-8'
	res.body = "Current Time: #{TOKEN}"
	
end
