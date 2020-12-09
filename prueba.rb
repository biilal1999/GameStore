require 'date'
require 'json'


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
            @tiendas[fila].push(t)
            @tiendas[fila][1] = Array.new
            @tiendas[fila][2] = Array.new

            for j in i["videojuegos"]
                nombre = j["nombreVideojuego"]
                descuento = j["descuento"]
                fecha = j["fechaLanzamiento"]
                fecha = Date.parse(fecha)
                precio = j["precioInicial"]
                puntos = j["puntos"]

                v = Videojuego.new(nombre, fecha, descuento, precio, puntos)
                @tiendas[fila][1].push(v)
            end

            for k in i["clientes"]
                nom = k["nombre"]
                codigo = k["codigo"]
                vec = Array.new

                for l in k["videojuegosComprados"]
                    nombre = l["nombreVideojuego"]
                    descuento = l["descuento"]
                    fecha = l["fechaLanzamiento"]
                    fecha = Date.parse(fecha)
                    precio = l["precioInicial"]
                    puntos = l["puntos"]

                    v = Videojuego.new(nombre, fecha, descuento, precio, puntos)
                    vec.push(v)
                end

                cli = Cliente.new(nom, Date.today, t)
                cli.videojuegosComprados = vec

                @tiendas[fila][2].push(cli)
            end
        end
    end


    puts "Hola"

end
