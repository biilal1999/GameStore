require 'json'
require 'date'
require_relative 'Videojuego.rb'
require_relative 'Ciudades.rb'
require_relative 'Tienda.rb'
require_relative 'Cliente.rb'
require_relative 'ArrayDator.rb'

class Admin

    attr_reader :dator

    def initialize(dator)
        @dator = dator
    end

    def existeTienda
        @dator.existeTienda
    end

    def comprobarTienda(ciudad)
        @dator.comprobarTienda(ciudad)
    end

    def tiendaValida(ciudad)
        @dator.tiendaValida(ciudad)
    end

    def encontrarTienda(nti)
        @dator.encontrarTienda(nti)
    end

    def nuevoVideojuego(nombre, desc, precio, puntos, ciudad)
        @dator.nuevoVideojuego(nombre, desc, precio, puntos, ciudad)
    end

    def saberPrecioFinal(nom, ti)
        @dator.saberPrecioFinal(nom, ti)
    end

    def saberDiasRestantes(nom, ti)
        @dator.saberDiasRestantes(nom, ti)
    end

    def saberEdadMedia(nom, ti)
        @dator.saberEdadMedia(nom, ti)
    end

    def existeCliente(cli, ti)
        @dator.existeCliente(cli, ti)
    end

    def clienteCompraVideojuego(cli, vid, ciu)
        @dator.clienteCompraVideojuego(cli, vid, ciu)
    end

    def saberPuntos(cli, ti)
        @dator.saberPuntos(cli, ti)
    end

    def crearTienda(ciudad)
        @dator.crearTienda(ciudad)
    end

    def insertarVideojuegoTienda(ciudad, vid)
        @dator.insertarVideojuegoTienda(ciudad, vid)
    end

    def obtenerMasStocks(ciudad)
        @dator.obtenerMasStocks(ciudad)
    end

    def eliminarVideojuego(ciudad, vid)
        @dator.eliminarVideojuego(ciudad, vid)
    end
end
