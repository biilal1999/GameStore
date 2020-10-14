require_relative 'Videojuego.rb'
require_relative 'Ciudades.rb'

class Tienda
		
	attr_reader:videojuegos
	attr_reader:ciudades
		

	def initialize (ciu)
		@ciudades = []
		@videojuegos = []				# Array de objetos de la clase Videojuego
		@ciudades.push(ciu)				# Array de valores de la clase ENUM Ciudades
			
	end

	
	def addVideojuego (videojuego)
		@videojuegos.push(videojuego)
	end

	
	def addCiudad (ciudad)
		@ciudades.push(ciudad)
	end

	
	def obtenerSedes()
		ubicaciones = ""

		for ubi in @ciudades
			ubicaciones = ubicaciones + ubi.to_s + " | "
		end

		return ubicaciones
	end


	def obtenerVideojuegos()
		productos = ""

		for vj in @videojuegos
			productos = productos + vj.obtenerNombre() + " | "
		end

		return productos
	end


end

