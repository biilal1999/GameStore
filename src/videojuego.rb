class Videojuego
    
    attr_accessor:nombreVideojuego
    attr_accessor:fechaLanzamiento
    attr_accessor:descuento
    attr_accessor:reservado
        
        
        def initialize (nombre, fecha, desc)
            @nombreVideojuego = nombre
            @fechaLanzamiento = fecha
            @descuento = desc
            @reservado = false
            
        end
        
        
        
        def consultarFechaLanzamiento()                                           # Corresponde a la HU01
            
        end
        
        
        
        def consultarDescuento()                                                  # Corresponde a la HU02
            
        end
        
        
        
        def reservarVideojuego (dniComprador)                                     # Corresponde a la HU03
            
        end
        
        
end
    
