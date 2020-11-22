require_relative 'Videojuego.rb'
require_relative 'Ciudades.rb'
require_relative 'Cliente.rb'

class Tienda
		
	attr_reader:videojuegos
	attr_reader:ciudad
	attr_reader:clientes
		

	def initialize (ciu)
		@videojuegos = Array.new             			# Array de Array objetos de la clase Videojuego
		@ciudad = ciu    					# Array de valores de la clase ENUM Ciudades
		@clientes = Array.new					# Array de clientes de la tienda
			
	end


	def obtenerSigCodigo()							# Obtiene el código disponible para el siguiente cliente de la tienda
		res = -1
	
		if @clientes.size == 0
			res = 0

		else 
			cli = @clientes[@clientes.size-1]
			res = cli[0].obtenerCodigo() + 1
		end

		
		return res
	end


	def identificarVideojuego(nombreVideojuego)					# Devuelve un objeto videojuego a partir de su nombre
		obj = nil

		for vi in @videojuegos
			if vi[0].obtenerNombre() == nombreVideojuego
				obj = vi[0]
			end
		end

		if obj == nil
			raise ArgumentError.new("El videojuego no está disponible en el catálogo de la tienda")
		end

		return obj
	end


	def venderProducto (cli, vj)							# Vende un producto modificando las muestras de los videojuegos disponibles de la tienda
											# Además, añade el videojueg a la lista de videojuegos del cliente identificado por su código
		for vi in @videojuegos
			if vi[0].obtenerNombre() == vj.obtenerNombre()
				vi[1] = vi[1] - 1

				if (vi[1] == 0)
					@videojuegos.delete(vi)
				end
			end
		end

		
		indice = @clientes.index(cli)

		if indice == nil
			fila = @clientes.size
			@clientes[fila] = Array.new
			@clientes[fila].push(cli)
			@clientes[fila][1] = Array.new
			@clientes[fila][1].push(vj)
			@clientes[fila][2] = Array.new
			@clientes[fila][2].push(vj.puntos)
		
		else 
			@clientes[indice][1].push(vj)
			@clientes[fila][2] = Array.new
			@clientes[fila][2].push(vj.puntos)
		end
	end
		

	
	def addVideojuego (videojuego)							# Añade objeto videojuego al array
		ind = indiceVideojuego(videojuego)
		
		if (ind == -1)							
			fila = @videojuegos.size		
			@videojuegos[fila] = Array.new
			@videojuegos[fila].push(videojuego)
			@videojuegos[fila].push(1)
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
			for i in 0..(numFilas - 1)
				if (@videojuegos[i][0].obtenerNombre() == vid.obtenerNombre())
					indice = i
				end
			end
		end

		return indice
	end


	def masMuestras()										# Corresponde a la HU04
		if @videojuegos.size == 0
			raise StandardError.new("No hay videojuegos actualmente en la tienda")
		
		else
			res = @videojuegos[0][0].obtenerNombre()
			num = @videojuegos[0][1]
			
			for i in 0..(@videojuegos.size - 1)
				if @videojuegos[i][1] > num
					num = @videojuegos[i][1]
					res = @videojuegos[i][0].obtenerNombre()
				end
			end
		end

		return res
	end
			
end

