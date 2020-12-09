require 'date'
require 'json'
require_relative 'Videojuego.rb'
require_relative 'Ciudades.rb'
require_relative 'Tienda.rb'
require_relative 'Cliente.rb'


class Prueba

    attr_accessor :tiendas

    def initialize
        @datos = JSON.parse(File.read(File.join(File.dirname(__FILE__), '../datos.json')))
        @tiendas = Array.new

        for i in @datos["tiendas"]
            fila = @tiendas.size
            @tiendas[fila] = Array.new
            ciu = i["ciudad"]
            t = Tienda.new(ciu)
            @tiendas[fila] = t

            for j in i["videojuegos"]
                nombre = j["nombreVideojuego"]
                descuento = j["descuento"]
                fecha = j["fechaLanzamiento"]
                fecha = Date.parse(fecha)
                precio = j["precioInicial"]
                puntos = j["puntos"]

                v = Videojuego.new(nombre, fecha, descuento, precio, puntos)
                @tiendas[fila].addVideojuego(v)
            end

            for k in i["clientes"]
                nom = k["nombre"]
                cli = Cliente.new(nom, Date.today, t)

                for l in k["videojuegosComprados"]
                    nombre = l["nombreVideojuego"]
                    descuento = l["descuento"]
                    fecha = l["fechaLanzamiento"]
                    fecha = Date.parse(fecha)
                    precio = l["precioInicial"]
                    puntos = l["puntos"]

                    v = Videojuego.new(nombre, fecha, descuento, precio, puntos)
                    t.venderProducto(cli, v)
                end
            end
        end
    end


    puts "Hola"

    p = Prueba.new

    puts p.tiendas.size
    puts p.tiendas[0].videojuegos.size
    puts p.tiendas[0].videojuegos[0][1]
    puts p.tiendas[0].clientes.size
    puts p.tiendas[0].clientes[0][0].nombre
    puts p.tiendas[0].clientes[1][0].nombre
    puts p.tiendas[0].clientes[2][0].nombre
    puts p.tiendas[0].clientes[3][0].nombre
    puts p.tiendas[0].clientes[3][1][0].nombreVideojuego
    puts p.tiendas[0].clientes[3][0].nombre
    puts p.tiendas[1].clientes[0][1].size

end
