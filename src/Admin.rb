require 'json'
require 'date'
require_relative 'Videojuego.rb'
require_relative 'Ciudades.rb'
require_relative 'Tienda.rb'
require_relative 'Cliente.rb'

class Admin

    attr_reader :ciudades
    attr_reader :tiendas
    attr_reader :clientes
    attr_reader :videojuegos
    attr_reader :datos

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
                if ciudad.casecmp(t.ciudad) == 0
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
        for i in (0..@ciudades.size - 1)
            if ciudad.casecmp(@ciudades[i])
                ciu = @ciudades[i].downcase
                ciu = ciu.capitalize
                t = Tienda.new(ciu)
                @tiendas.push(t)
            end
        end
    end

    def insertarVideojuegoTienda(ciudad, vid)
        raise "Método 'insertarVideojuegoTienda(ciudad, vid)' debe ser implementado"
    end

    def obtenerMasStocks(ciudad)
        raise "Método 'obtenerMasStocks(ciudad)' debe ser implementado"
    end

end
