require_relative 'Videojuego.rb'
require_relative 'Ciudades.rb'

class Tienda
		
	attr_reader:videojuegos
	attr_reader:ciudades
		

	def initialize (ciu)
		@ciudades = Array.new
		@videojuegos = Array.new				# Array de objetos de la clase Videojuego
		@ciudades.push(ciu)					# Array de valores de la clase ENUM Ciudades
			
	end

	
	def addVideojuego (videojuego)							# Añade objeto videojuego al array
		@videojuegos.push(videojuego)
	end

	
	def addCiudad (ciudad)								# Añade sede al array
		@ciudades.push(ciudad)
	end

	
	def obtenerSedes()									# Devuelve una cadena con todas las sedes
		return @ciudades
	end


	def obtenerVideojuegos()								# Devuelve una cadena con los nombres de todos los videojuegos
		productos = Array.new

		for vj in @videojuegos
			productos.push(vj.obtenerNombre())
		end

		return productos
	end


end

