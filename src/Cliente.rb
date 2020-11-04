require_relative 'Videojuego.rb'
require_relative 'Ciudades.rb'
require_relative 'Tienda.rb'
require 'date'


class Cliente

	attr_reader:nombre
	attr_reader:codigo
        attr_reader:videojuegosComprados
        attr_reader:fechaNacimiento
	attr_reader:tiendaFavorita

       
    	def initialize (nombre, fecha, tienda)
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



	def cambiarTiendaFavorita (tienda)
		if (tienda.instance_of?(Tienda) == false)
			raise ArgumentError.new("No es una tienda existente")
		end

		@tiendaFavorita = tienda
		@codigo = @tiendaFavorita.obtenerSigCodigo
	end

	
	def obtenerMiEdad()
		now = Date.today
		year = now.year - @fechaNacimiento.year

		if (date + year.year) > now
			year = year - 1
		end

		return year
	end

	
	def comprarVideojuego (nombreVideojuego)
		if (@tienda.instance_of?(Tienda) == false)
			raise StandardError.new("El cliente no tiene una tienda asignada")
		end
	
		if (@fechaNacimiento.instance_of?(Date) == false)
			raise StandardError.new("El cliente no tiene una fecha de nacimiento asignada")
		end

		vid = @iienda.identificarVideojuego (nombreVideojuego)
		@videojuegosComprados.push(vid)
		vid.addVenta(year)
		@tienda.venderProducto(@codigo, vid)
		cadena = "Videojuego " + nombreVideojuego + " comprado con éxito para " + @nombre

		return cadena	
	end




	
	
	
