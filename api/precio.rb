require 'json'


Handler = Proc.new do |req, res|

	cadena = Array.new
	videojuego = req.query['v']
	
	if videojuego == nil
		cadena = {error: "Tiene que enviar por parámetro el nombre del videojuego"}

	else
		info = JSON.parse(File.read(File.join(File.dirname(__FILE__), 'info.json')))


