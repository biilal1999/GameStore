require 'json'
require_relative 'Videojuego.rb'
require_relative 'Ciudades.rb'
require_relative 'Tienda.rb'
require_relative 'Cliente.rb'
require_relative 'Dator.rb'

class ArrayDator < Dator

    attr_reader :ciudades

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

end
