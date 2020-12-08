require 'sinatra'
require 'json'
require_relative 'ArrayDator.rb'
require_relative 'Admin.rb'


class ApiGame < Sinatra::Base

	dator = ArrayDator.new
	admin = Admin.new(dator)

	get '/' do

		if admin.existeTienda == false
			cadena = { :info => "Empiece creando una tienda para usar nuestra API, usando la petición /tienda/Granada si quiere por ejemplo crearla en Granada. Las ciudades disponibles son Granada, Madrid, Barcelona, Sevilla, Valencia, Vigo y Zaragoza"}
			status 200
			content_type 'application/json'
			cadena.to_json
		end
	end

	

end
