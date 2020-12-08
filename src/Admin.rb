require_relative 'ArrayDator.rb'

class Admin

    def initialize(dator)
        @dator = dator
    end

    def nuevoVideojuego(nombre, fecha, desc, precio)
        @dator.nuevoVideojuego(nombre, fecha, desc, precio)
    end

    def saberPrecioFinal(vid)
        @dator.saberPrecioFinal(vid)
    end

    def saberDiasRestantes(vid)
        @dator.saberDiasRestantes(vid)
    end

    def encontrarCliente(cli)
        @dator.encontrarCliente(cli)
    end

    def clienteCompraVideojuego(cli, vid)
        raise @dator.clienteCompraVideojuego(cli, vid)
    end

    def saberPuntos(cli, vid)
        raise @dator.saberPuntos(cli, vid)
    end

    def crearTienda(ciudad)
        raise @dator.crearTienda(ciudad)
    end

    def insertarVideojuegoTienda(ciudad, vid)
        raise @dator.insertarVideojuegoTienda(ciudad, vid)
    end

    def obtenerMasStocks(ciudad)
        raise @dator.obtenerMasStocks(ciudad)
    end

end
