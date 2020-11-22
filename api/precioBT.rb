require 'json'
require 'net/https'


TOKEN = ENV['TELEGRAM_BOT']

Handler = Proc.new do |req, res|

	mensaje = "holaaa"
	recibo = JSON.parse(req.body)
	chat = recibo["message"]["chat"]["id"]

	vuelta = {msg: mensaje, chat: chat}
	uri = URI("https://api.telegram.org")

	Net::HTTP.start(uri.hostname, uri.port, {use_ssl: true}) do |http|
            res = Net::HTTP::Get.new("/bot#{TOKEN}/sendMessage", {'Content-Type' => 'application/json; charset=utf-8'})
            res.body = vuelta.to_json
            http.request(res)
        end
	
	return { statusCode: 200 }
	
end
