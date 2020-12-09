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

		#begin
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

		#rescue => e
		#	status 400
		#	cadena = { :error => "Ruta introducida incorrectamente"}
		#	content_type 'application/json'
		#	cadena.to_json
		#end
	end

end
