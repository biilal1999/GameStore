require 'json'


Handler = Proc.new do |req, res|

	cadena = Array.new

	# Obtengo valor de la query string
	juego = req.query['v']
	
	# Si no se ha enviado ningún valor por la qs
	if juego == nil
		cadena = {error: "Tiene que enviar por parámetro el nombre del videojuego"}

	else
		# Leo del archivo .json donde está toda la información
		info = JSON.parse(File.read(File.join(File.dirname(__FILE__), 'info.json')))
		vid = nil
	
		# Busco el nombre del videojuego en el archivo de información
		for vj in info["videojuegos"]

			if juego.casecmp(vj["nombreVideojuego"]) == 0
				vid = vj
				break
			end
		end


		# En caso de que no se haya encontrado el videojuego
		if vid.nil?
			cadena = {error: "El videojuego " + juego + " no existe en el catálogo"}
		
		else
			precio = vid["precioInicial"]

			# Si el videojuego que se ha encontrado tiene un porcentaje de descuento
			if vid["descuento"] > 0.0
				desc = vid["descuento"]
				porcentaje = desc * 100
				coste = precio - (precio * desc)
				msg = "El precio del #{juego} era de #{precio} euros, pero estás de suerte! Porque tenemos para ti un #{porcentaje}% de descuento, y lo puedes conseguir por tan solo #{coste} euros"
			
			# Si el videojuego que se ha encontrado no tiene un porcentaje de descuento
			else
				msg = "El precio del #{juego} es de #{precio} euros"
			end


			cadena = {videojuego: vid["nombreVideojuego"], cad: msg}
		end
	end


	# Devuelvo el resultado en formato .json
	res.status = 200
	res['Content-Type'] = 'application/json; charset=utf-8'
	res.body = cadena.to_json;
end
