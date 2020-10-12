require 'date'

class Videojuego
    
    attr_accessor:nombreVideojuego
    attr_accessor:fechaLanzamiento
    attr_accessor:descuento
    attr_accessor:reservado
    attr_reader:precioInicial
    attr_accessor:dniUsuario
        
        
        def initialize (nombre, fecha, desc, precio)
            @nombreVideojuego = nombre
            @fechaLanzamiento = fecha
            @descuento = desc
            @reservado = false
	    @precioInicial = precio
	    @dniUsuario = ""
            
        end
        
        
        
        def consultarDiasRestantes()                                              # Corresponde a la HU01
            now = Date.today
	    dias_restantes = @fechaLanzamiento - now
	    dias = dias_restantes.to_i

	    return dias
        end
        
        
        
        def consultarPrecioFinal()                                                # Corresponde a la HU02
            precioFinal = @precioInicial - (@precioInicial * @descuento)

	    return precioFinal
        end
        
        
        
        def reservarVideojuego (dniComprador)                                     # Corresponde a la HU03
            if @reservado == false
	    	@dniUsuario = dniComprador
		@reservado = true

	    else
		puts 'El videojuego ya está reservado'
	    end
        end
        
        
end
    
