require 'json'
require_relative 'Videojuego.rb'
require_relative 'Ciudades.rb'
require_relative 'Tienda.rb'
require_relative "Cliente.rb"
requiere_relative "Dator.rb"

class ArrayDator < Dator

    def initialize
        @tiendas = Array.new
        @clientes = Array.new
        @videojuegos = Array.new
    end

    def existeTienda
        existe = false

        if @tiendas.size > 0
            existe = true
        end

        return existe
    end

end
