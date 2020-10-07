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
        
        
        
        def consultarFechaLanzamiento()
            
        end
        
        
        
        def consultarDescuento()
            
        end
        
        
        
        def reservarVideojuego (dniComprador)
            
        end
        
        
end
    
