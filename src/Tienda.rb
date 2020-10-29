require_relative 'Videojuego.rb'
require_relative 'Ciudades.rb'

class Tienda
		
	attr_reader:videojuegos
	attr_reader:ciudad
		

	def initialize (ciu)
		@videojuegos = Array.new             			# Array de Array objetos de la clase Videojuego
		@ciudad = ciu    					# Array de valores de la clase ENUM Ciudades
			
	end

	
	def addVideojuego (videojuego)							# Añade objeto videojuego al array
		ind = indiceVideojuego(videojuego)
		
		if (ind == -1)							
			fila = @videojuegos.size		
			@videojuegos[fila] = Array.new
			@videojuegos[fila].push(videojuego)
			@videojuegos[fila].push(0)
		else
			@videojuegos[ind][1] = @videojuegos[ind][1] + 1
		end
	end


	def obtenerVideojuegos()								# Devuelve una cadena con los nombres de todos los videojuegos
		productos = Array.new

		for vj in @videojuegos
			productos.push(vj[0].obtenerNombre())
		end

		return productos
	end

	
	def indiceVideojuego(vid)									# Método para saber si en esta tienda ya tenemos ese videojuego
		numFilas = @videojuegos.size
		indice = -1

		if numFilas > 0
			for i in 0..numFilas
				if (@videojuegos[i][0].obtenerNombre() == vid.obtenerNombre())
					indice = i
				end
			end
		end

		return indice
	end

end

