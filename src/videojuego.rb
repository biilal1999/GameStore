require 'date'

class Videojuego
    
    attr_accessor:nombreVideojuego
    attr_accessor:fechaLanzamiento
    attr_accessor:descuento
    attr_accessor:reservado
    attr_reader:precioInicial
        
        
        def initialize (nombre, fecha, desc, precio)
            @nombreVideojuego = nombre
            @fechaLanzamiento = fecha
            @descuento = desc
            @reservado = false
	    @precioInicial = precio
            
        end
        
        
        
        def consultarDiasRestantes()                                              # Corresponde a la HU01
            now = Date.today
	    dias_restantes = @fechaLanzamiento - now
	    dias = dias_restantes.to_i

	    return dias
        end
        
        
        
        def consultarPrecioFinal()                                                # Corresponde a la HU02
            
        end
        
        
        
        def reservarVideojuego (dniComprador)                                     # Corresponde a la HU03
            
        end
        
        
end
    
