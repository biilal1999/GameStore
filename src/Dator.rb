class Dator

    def initialize(path)
        if self.instance_of? Dator
            raise "Clase no instanciable"
        end
    end

    def existeTienda
        raise "Método 'existeTienda' debe ser implementado"
    end

    def comprobarTienda(ciudad)
        raise "Método 'comprobarTienda(ciudad)' debe ser implementado"
    end

    def tiendaValida(ciudad)
        raise "Método 'tiendaValida(ciudad)' debe ser implementado"
    end

    def encontrarTienda(nti)
        raise "Método 'encontrarTienda(nti)' debe ser implementado"
    end

    def nuevoVideojuego(nombre, fecha, desc, precio)
        raise "Método 'nuevoVideojuego(nombre, fecha, desc, precio)' debe ser implementado"
    end

    def saberPrecioFinal(nom, ti)
        raise "Método 'saberPrecioFinal(nom, ti)' debe ser implementado"
    end

    def saberDiasRestantes(nom, ti)
        raise "Método 'saberDiasRestantes(nom, ti)' debe ser implementado"
    end

    def saberEdadMedia(nom, ti)
        raise "Método 'saberEdadMedia(nom, ti)' debe ser implementado"
    end

    def existeCliente(cli, ti)
        raise "Método 'existeCliente(cli, ti)' debe ser implementado"
    end

    def clienteCompraVideojuego(cli, vid)
        raise "Método 'clienteCompraVideojuego(cli, vid)' debe ser implementado"
    end

    def saberPuntos(cli, ti)
        raise "Método 'saberPuntos(cli, ti)' debe ser implementado"
    end

    def crearTienda(ciudad)
        raise "Método 'crearTienda(ciudad)' debe ser implementado"
    end

    def insertarVideojuegoTienda(ciudad, vid)
        raise "Método 'insertarVideojuegoTienda(ciudad, vid)' debe ser implementado"
    end

    def obtenerMasStocks(ciudad)
        raise "Método 'obtenerMasStocks(ciudad)' debe ser implementado"
    end
end
