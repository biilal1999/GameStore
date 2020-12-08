class Dator

    attr_reader :tiendas
    attr_reader :clientes
    attr_reader :videojuegos


    def initialize
        raise "Clase no instanciable"
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

    def nuevoVideojuego(nombre, fecha, desc, precio)
        raise "Método 'nuevoVideojuego(nombre, fecha, desc, precio)' debe ser implementado"
    end

    def saberPrecioFinal(vid)
        raise "Método 'nuevoVideojuego(nombre, fecha, desc, precio)' debe ser implementado"
    end

    def saberDiasRestantes(vid)
        raise "Método 'saberDiasRestantes(vid)' debe ser implementado"
    end

    def encontrarCliente(cli)
        raise "Método 'encontrarCliente(cli)' debe ser implementado"
    end

    def clienteCompraVideojuego(cli, vid)
        raise "Método 'clienteCompraVideojuego(cli, vid)' debe ser implementado"
    end

    def saberPuntos(cli, vid)
        raise "Método 'saberPuntos(cli, vid)' debe ser implementado"
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
