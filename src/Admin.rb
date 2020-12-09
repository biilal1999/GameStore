require 'json'
require_relative 'Videojuego.rb'
require_relative 'Ciudades.rb'
require_relative 'Tienda.rb'
require_relative 'Cliente.rb'
require_relative 'Dator.rb'

class Admin

    attr_reader :ciudades
    attr_reader :tiendas
    attr_reader :clientes
    attr_reader :videojuegos

    def initialize
        @tiendas = Array.new
        @clientes = Array.new
        @videojuegos = Array.new

        @ciudades = Array.new
        @ciudades.push("Granada")
        @ciudades.push("Madrid")
        @ciudades.push("Barcelona")
        @ciudades.push("Sevilla")
        @ciudades.push("Valencia")
        @ciudades.push("Zaragoza")
        @ciudades.push("Vigo")
    end

    def existeTienda
        existe = false

        if @tiendas.size > 0
            existe = true
        end

        return existe
    end

    def comprobarTienda(ciudad)
        if @tiendas.size == 0
            return false

        else
            res = false

            for t in @tiendas
                if t.ciudad == ciu
                    res = true
                end
            end

            return res

        end
    end

    def tiendaValida(ciudad)
        res = false
        indice = 0

        while indice < 7 and res == false
            if ciudad.casecmp(@ciudades[indice]) == 0
                res = true
            end

            indice = indice + 1

        end

        return res
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
