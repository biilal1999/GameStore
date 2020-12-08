require 'sinatra'
require 'json'
require_relative 'ArrayDator.rb'


class ApiGame < Sinatra::Base
	@dator = ArrayDator.new
	@admin = Admin.new(@dator)

	get '/' do
		if @admin.existeTienda == false
			"No hay tienda"
		end
	end
end
