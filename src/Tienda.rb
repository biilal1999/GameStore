require_relative 'Videojuego.rb'
require_relative 'Ciudades.rb'

class Tienda
		
	attr_reader:videojuegos
	attr_reader:ciudades
		

	def initialize (ciu)
		@videojuegos = []				# Array de objetos de la clase Videojuego
		@ciudades = ciu					# Array de valores de la clase ENUM Ciudades
			
	end

	
	def addVideojuego (videojuego)
		@videojuegos.push(videojuego)
	end

	
	def addCiudad (ciudad)
		@ciudades.push(ciudad)
	end


end

