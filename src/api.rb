require 'sinatra'
require 'json'


class PruebaSinatra < Sinatra::Base

	get '/' do
		"Hola Sinatra!"
	end
end
