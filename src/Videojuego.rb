
require 'date'
require 'net/http'
require 'json'

class Videojuego
	    
	    attr_reader:nombreVideojuego
	    attr_reader:fechaLanzamiento
	    attr_reader:descuento
	    attr_reader:edadesVentas
	    attr_reader:precioInicial
	    attr_reader:garantia
		
		
		def initialize (nombre, fecha, desc, precio, garantia = nil)
		    @nombreVideojuego = nombre
		    @fechaLanzamiento = fecha
		    @descuento = desc
		    @edadesVentas = []
		    @precioInicial = precio
		    
		    if garantia.nil?
			@garantia = garantia

		    else

			    if garantia <= 0
				raise ArgumentError.new("Los días de garantía deben ser mayores que cero")
			    else
				@garantia = garantia
			    end
		    end

		end
		
		
		
		def consultarDiasRestantes()                                              # Corresponde a la HU01
		    now = Date.today
		    dias_restantes = @fechaLanzamiento - now

		    dias = dias_restantes.to_i

                    if dias < 0
                       raise StandardError.new("El juego ya salió anteriormente")
		    end

		    return dias
		end
		
		
		
		def consultarPrecioFinal()                                                # Corresponde a la HU02
		    precioFinal = @precioInicial - (@precioInicial * @descuento)

		    return precioFinal
		end
		
		
		
		def consultarMediaEdad() 	                                          # Corresponde a la HU03
		    suma = 0
		    ventas = @edadesVentas.length

                    if ventas == 0
                       raise StandardError.new("No hay ventas de momento para el videojuego")
		    end

		    for edad in @edadesVentas
                       suma = suma + edad
		    end
			    
		    media = ((suma * 1.0) / ventas)
		    
		    return media
		end


		def obtenerNombre()																			
			return @nombreVideojuego
		end
	    
		
		def addVenta (edad)                                                       # Añade edades al array cuando se realiza una venta
		    @edadesVentas.push(edad)
		end

end
