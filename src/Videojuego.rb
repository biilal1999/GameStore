
require 'date'

class Videojuego
	    
	    attr_reader:nombreVideojuego
	    attr_reader:fechaLanzamiento
	    attr_reader:descuento
	    attr_reader:edadesVentas
	    attr_reader:precioInicial
		
		
		def initialize (nombre, fecha, desc, precio)
		    @nombreVideojuego = nombre
		    @fechaLanzamiento = fecha
		    @descuento = desc
		    @edadesVentas = []
		    @precioInicial = precio
		end
		
		
		
		def consultarDiasRestantes()                                              # Corresponde a la HU01
		    now = Date.today
		    dias_restantes = @fechaLanzamiento - now

		    dias = dias_restantes.to_i

                    if dias < 0
                       raise ArgumentError.new("El juego ya salió anteriormente")
		    end

		    return dias
		end
		
		
		
		def consultarPrecioFinal()                                                # Corresponde a la HU02
		    precioFinal = @precioInicial - (@precioInicial * @descuento)

		    return precioFinal
		end
		
		
		
		def consultarMediaEdad() 	                                          # Corresponde a la HU03
		    suma = 0
		     
		    begin
		       ventas = @edadesVentas.length
		       raise 'No hay ventas de momento' if ventas == 0

		       for edad in @edadesVentas
			   suma = suma + edad
		       end
			    
		       media = ((suma * 1.0) / ventas)

		    rescue => media
	 	    end
		    
		    return media
		end


		def obtenerNombre()																			
			return @nombreVideojuego
		end
	    
		
		def addVenta (edad)                                                       # Añade edades al array cuando se realiza una venta
		    @edadesVentas.push(edad)
		end

end
