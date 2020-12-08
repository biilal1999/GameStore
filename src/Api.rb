require 'sinatra'
require 'json'
require_relative 'ArrayDator.rb'


class ApiGame < Sinatra::Base
	@dator = ArrayDator.new
	@admin = Admin.new(@dator)
	
	get '/' do
		"Hola  de nuevo Sinatra!"
	end
end
