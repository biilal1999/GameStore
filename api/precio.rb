require 'json'


Handler = Proc.new do |req, res|

	cadena = Array.new
	juego = req.query['v']
	
	if juego == nil
		cadena = {error: "Tiene que enviar por parámetro el nombre del videojuego"}

	else
		info = JSON.parse(File.read(File.join(File.dirname(__FILE__), 'info.json')))

		encontrado = false
		vid = nil
	
		for vj in info["videojuegos"]

			if juego.casecmp(vj["nombreVideojuego"])
				vid = vj
			end
		end



