require 'sinatra'
require 'json'
require_relative 'Admin.rb'


class ApiGame < Sinatra::Base

	before do
		@admin = Admin.new
	end


	get '/' do
		if @admin.existeTienda == false
			cadena = { :info => "Empiece creando una tienda para usar nuestra API, usando la petición /tienda y un parámetro ciudad por POST. Las ciudades disponibles son Granada, Madrid, Barcelona, Sevilla, Valencia, Vigo y Zaragoza"}
			status 200
			content_type 'application/json'
			cadena.to_json

		else
			cadena = { :info => "Crack" }
			status 200
			content_type 'application/json'
			cadena.to_json
		end
	end


	get '/precio/:videojuego/:tienda' do
		nvid = params['videojuego']
		nti = params['tienda']

		if @admin.comprobarTienda(nti) == false
			status 404
			cadena = { :error => "La tienda no existe!"}
			content_type 'application/json'
			cadena.to_json

		else
			begin
				precio = @admin.saberPrecioFinal(nvid, nti)
				status 200
				cadena = { :info => "El precio final del videojuego #{nvid} es de #{precio} euros"}
				content_type 'application/json'
				cadena.to_json

			rescue => e
				status 404
				cadena = { :error => "El videojuego #{nvid} no existe en esta tienda"}
				content_type 'application/json'
				cadena.to_json
			end
		end
	end

	get '/dias/:videojuego/:tienda' do
		nvid = params['videojuego']
		nti = params['tienda']

		if @admin.comprobarTienda(nti) == false
			status 404
			cadena = { :error => "La tienda no existe!"}
			content_type 'application/json'
			cadena.to_json

		else
			begin
				dias = @admin.saberDiasRestantes(nvid, nti)
				status 200
				cadena = { :info => "Quedan solo #{dias} días para que salga el #{nvid}"}
				content_type 'application/json'
				cadena.to_json

			rescue => e
				status 404
				cadena = { :error => "No hay disponible un #{nvid} con fecha de salida pendiente en esta tienda"}
				content_type 'application/json'
				cadena.to_json
			end
		end
	end


	post '/tienda' do
		begin
			datos = JSON.parse(request.body.read)
			city = datos["ciudad"]

		rescue => e
			status 400
			cadena = { :error => "Ruta introducida incorrectamente!!!"}
			content_type 'application/json'
			cadena.to_json
		end

		begin
			if @admin.tiendaValida(city) == false
				status 404
				cadena = { :error => "La ciudad #{city} no es válida"}
				content_type 'application/json'
				cadena.to_json

			else

				if @admin.comprobarTienda(city) == true
					status 404
					cadena = { :error => "La ciudad #{city} ya existe. Pruebe con otra"}
					content_type 'application/json'
					cadena.to_json

				else
					@admin.crearTienda(city)

					if @admin.comprobarTienda(city) == true
						status 200
						cadena = { :info => "La tienda con sede en #{city} ha sido creada con éxito"}
						content_type 'application/json'
						cadena.to_json
					else
						status 404
						cadena = { :error => "Cómeme los huevos"}
						content_type 'application/json'
						cadena.to_json
					end
				end
			end

		rescue => e
			status 400
			cadena = { :error => "Ruta introducida incorrectamente"}
			content_type 'application/json'
			cadena.to_json
		end
	end

end
