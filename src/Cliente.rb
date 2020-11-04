require_relative 'Videojuego.rb'
require_relative 'Ciudades.rb'
require_relative 'Tienda.rb'
require 'date'


class Cliente

	attr_reader:nombre							# Nombre del cliente (string)
	attr_reader:codigo							# Código del cliente de la tienda (int)
        attr_reader:videojuegosComprados					# Array de instancias de Videojuego
        attr_reader:fechaNacimiento						# fecha tipo Date
	attr_reader:tiendaFavorita						# tienda favorita del cliente, (Ciudad)

       
    	def initialize (nombre, fecha, tienda)								# Constructor para el cliente
		if (fecha.instance_of?(Date) == false)
			raise ArgumentError.new("No es una fecha de cumpleaños válida")
		end

		if (tienda.instance_of?(Tienda) == false)
			raise ArgumentError.new("No es una tienda existente")
		end

		@nombre = nombre
		@fechaNacimiento = fecha
		@tiendaFavorita = tienda
		@videojuegosComprados = Array.new
		@codigo = @tiendaFavorita.obtenerSigCodigo
	end



	def cambiarTiendaFavorita (tienda)								# Actualiza la tienda favorita del cliente
		if (tienda.instance_of?(Tienda) == false)
			raise ArgumentError.new("No es una tienda existente")
		end

		@tiendaFavorita = tienda
		@codigo = @tiendaFavorita.obtenerSigCodigo()
	end


	def obtenerCodigo()
		return @codigo
	end

	
	def obtenerMiEdad()										# Obtiene la edad del cliente a partir de su fecha de nacimiento
		now = Date.today
		age = now.year - @fechaNacimiento.year

		if now < @fechaNacimiento + age
			age -=1
		end

		return age
	end

	
	def comprarVideojuego (nombreVideojuego)								# Permite al cliente comprar un videojuego, corresponde con HU05
		if (@tiendaFavorita.instance_of?(Tienda) == false)
			raise StandardError.new("El cliente no tiene una tienda asignada")
		end
	
		if (@fechaNacimiento.instance_of?(Date) == false)
			raise StandardError.new("El cliente no tiene una fecha de nacimiento asignada")
		end

		vid = @tiendaFavorita.identificarVideojuego (nombreVideojuego)
		@videojuegosComprados.push(vid)
		vid.addVenta(obtenerMiEdad())
		@tiendaFavorita.venderProducto(self, vid)
		cadena = "Videojuego " + nombreVideojuego + " comprado con éxito para " + @nombre

		return cadena	
	end

end


