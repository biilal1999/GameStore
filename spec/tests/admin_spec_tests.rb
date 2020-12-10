require_relative '../../src/Admin.rb'


describe Admin do
    admin = Admin.new(ArrayDator.new('../datos.json'))

    describe '#Constructor' do
        it '2 tiendas de inicio' do
            expect(admin.dator.tiendas.size).to eq(2)
        end
    end

    describe '#existeTienda' do
        it 'Sí hay ya tiendas' do
            expect(admin.existeTienda).to eq(true)
        end
    end

    describe '#comprobarTienda' do
        it 'Hay una tienda en Granada' do
            expect(admin.comprobarTienda("Granada")).to eq(true)
        end
    end

    describe '#tiendaValida' do
        it 'Madrid es válida' do
            expect(admin.tiendaValida("Madrid")).to eq(true)
        end
    end

    describe '#encontrarTienda' do
        it 'Se devuelve el objeto Tienda con sede en Barcelona' do
            expect(admin.encontrarTienda("Barcelona")).to be_kind_of(Tienda)
        end
    end

    describe '#nuevoVideojuego' do
        it 'Se añade un cuarto videojuego a la tienda de Barcelona, el Valorant' do
            admin.nuevoVideojuego("Valorant", 0.3, 19, 12, "Barcelona")
            expect(admin.dator.tiendas[1].videojuegos.size).to eq(4)
        end
    end

    describe '#saberPrecioFinal' do
        it '49 euros cuesta el FIFA' do
            expect(admin.saberPrecioFinal("FIFA", "Granada")).to eq(49.0)
        end
    end

    describe '#saberDiasRestantes' do
        it 'Quedan días para el GTA' do
            expect{ admin.saberDiasRestantes("GTA", "Granada") }.not_to raise_error
        end
    end

    describe '#saberEdadMedia' do
        it '21 años la media del FIFA' do
            expect(admin.saberEdadMedia("FIFA", "Granada")).to eq(21.0)
        end
    end

    describe '#existeCliente' do
        it 'La tienda del cliente con sede en Granada' do
            expect(admin.existeCliente("Bilal", "Granada")).to be_kind_of(Tienda)
        end
    end

    describe '#clienteCompraVideojuego' do
        it 'JJ compra el FIFA en Granada' do
            expect{ admin.clienteCompraVideojuego("JJ", "FIFA", "Granada") }.not_to raise_error
        end
    end

    describe '#saberPuntos' do
        it 'Bilal tiene 17 puntos acumulados' do
            expect(admin.saberPuntos("Bilal", "Granada")).to be(17)
        end
    end

    describe '#crearTienda' do
        it 'Creamos una tienda en Sevilla y ya tenemos 3' do
            admin.crearTienda("Sevilla")
            expect(admin.dator.tiendas.size).to be(3)
        end
    end


    describe '#insertarVideojuegoTienda' do
        it 'Añadimos dos FIFAs al stock y ya tenemos 3' do
            admin.insertarVideojuegoTienda("Granada", "FIFA")
            admin.insertarVideojuegoTienda("Granada", "FIFA")
            expect(admin.dator.tiendas[0].videojuegos[0][1]).to eq(3)
        end
    end


    describe '#obtenerMasStocks' do
        it 'El videojuego con más unidades en stock en Granada es el FIFA' do
            expect(admin.obtenerMasStocks("Granada")).to eq("FIFA")
        end
    end

    describe '#eliminarVideojuego' do
        it 'Eliminamos una unidad de FIFA en Barcelona y ya solo nos queda 1' do
            admin.eliminarVideojuego("Barcelona", "FIFA")
            expect(admin.dator.tiendas[1].videojuegos[0][1]).to eq(1)
        end
    end
end
