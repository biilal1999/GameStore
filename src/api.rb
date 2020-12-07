require 'sinatra'
require 'json'


class PruebaSinatra < Sinatra::Base

	get '/' do
		"Hola  de nuevo Sinatra!"
	end
end
