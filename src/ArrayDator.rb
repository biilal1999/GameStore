require 'json'
require 'date'
require_relative 'Videojuego.rb'
require_relative 'Ciudades.rb'
require_relative 'Tienda.rb'
require_relative 'Cliente.rb'
require_relative 'Dator.rb'

class ArrayDator < Dator

    attr_reader :ciudades
    attr_reader :tiendas
    attr_reader :datos

    def initialize(path)
        @datos = JSON.parse(File.read(File.join(File.dirname(__FILE__), path)))
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
                cumple = k["fechaNacimiento"]
                cumple = Date.parse(cumple)
                cli = Cliente.new(nom, cumple, t)

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

    def encontrarTienda(nti)
        obj = nil

        for i in @tiendas
            if nti.casecmp(i.ciudad) == 0
                obj = i
            end
        end

        return obj
    end

    def nuevoVideojuego(nombre, desc, precio, puntos, ciudad)
        t = encontrarTienda(ciudad)
        v = Videojuego.new(nombre, Date.new(2021, 12, 15), desc, precio, puntos)
        nomvid = t.obtenerVideojuegos

        esta = false

        for i in nomvid
            if i.casecmp(nombre) == 0
                esta = true
            end
        end

        if esta == false
            t.addVideojuego(v)
        else
            raise ArgumentError.new("El videojuego ya existía")
        end
    end

    def saberPrecioFinal(nom, ti)
        t = encontrarTienda(ti)
        v = t.identificarVideojuego(nom)
        precio = v.consultarPrecioFinal

        return precio
    end

    def saberDiasRestantes(nom, ti)
        t = encontrarTienda(ti)
        v = t.identificarVideojuego(nom)
        dias = v.consultarDiasRestantes

        return dias
    end

    def saberEdadMedia(nom, ti)
        t = encontrarTienda(ti)
        v = t.identificarVideojuego(nom)
        edad = v.consultarMediaEdad

        return edad
    end

    def existeCliente(cli, ti)
        t = encontrarTienda(ti)
        c = t.buscarCliente(cli)

        return t
    end

    def clienteCompraVideojuego(cli, vid, ciu)
        t = encontrarTienda(ciu)
        arrayClientes = t.clientes

        c = nil

        for obj in arrayClientes
            if obj[0].nombre == cli
                c = obj[0]
            end
        end

        if c.nil?
            c = Cliente.new(cli, Date.today, t)
        end

        c.comprarVideojuego(vid)
    end

    def saberPuntos(cli, ti)
        t = existeCliente(cli, ti)
        puntos = t.obtenerPuntosAcumulados(cli)

        return puntos
    end

    def crearTienda(ciudad)
        for i in (0..@ciudades.size - 1)
            if ciudad.casecmp(@ciudades[i]) == 0
                ciu = @ciudades[i].downcase
                ciu = ciu.capitalize
                t = Tienda.new(ciu)
                @tiendas.push(t)
            end
        end
    end

    def insertarVideojuegoTienda(ciudad, vid)
        t = encontrarTienda(ciudad)
        v = t.identificarVideojuego(vid)
        t.addVideojuego(v)
    end

    def obtenerMasStocks(ciudad)
        t = encontrarTienda(ciudad)
        juego = t.masMuestras

        return juego
    end


    def eliminarVideojuego(ciudad, vid)
        t = encontrarTienda(ciudad)
        v = t.identificarVideojuego(vid)
        t.eliminarVideojuego(v)
    end

end
