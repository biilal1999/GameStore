require_relative '../../src/ArrayDator.rb'


describe ArrayDator do
    dator = ArrayDator.new('../datos.json')

    describe '#Constructor' do
        it 'Existen 4 clientes en la tienda de Granada' do
            expect(dator.tiendas[0].clientes.size).to eq(4)
        end
    end

    describe '#existeTienda' do
        it 'Hay tiendas' do
            expect(dator.existeTienda).to eq(true)
        end
    end

    describe '#comprobarTienda' do
        it 'No hay tienda en Valladolid' do
            expect(dator.comprobarTienda("Valladolid")).to eq(false)
        end
    end

    describe '#tiendaValida' do
        it 'Bilbao no es sede válida' do
            expect(dator.tiendaValida("Bilbao")).to eq(false)
        end
    end

    describe '#encontrarTienda' do
        it 'Devuelve nulo porque no tenemos ahora mismo tienda en Zaragoza' do
            expect(dator.encontrarTienda("Zaragoza")).to be_nil
        end
    end

    describe '#nuevoVideojuego' do
        it 'No se puede pedir más FIFAs para Barcelona porque hay en stock' do
            expect{ dator.nuevoVideojuego("FIFA", 0.3, 19, 12, "Barcelona") }.to raise_error(ArgumentError)
        end
    end

    describe '#saberPrecioFinal' do
        it 'No existe el videojuego' do
            expect{ dator.saberPrecioFinal("CS", "Granada") }.to raise_error(ArgumentError)
        end
    end

    describe '#saberDiasRestantes' do
        it 'No existe el videojuego' do
            expect{ dator.saberDiasRestantes("CS", "Granada") }.to raise_error(ArgumentError)
        end
    end

    describe '#saberEdadMedia' do
        it 'No existe el videojuego' do
            expect{ dator.saberEdadMedia("CS", "Granada") }.to raise_error(ArgumentError)
        end
    end

    describe '#existeCliente' do
        it 'La tienda del cliente no existe, ya que no existe el cliente' do
            expect{ dator.existeCliente("Juan", "Granada") }.to raise_error(ArgumentError)
        end
    end

    describe '#clienteCompraVideojuego' do
        it 'No hay Tetris en Granada para comprar' do
            expect{ dator.clienteCompraVideojuego("JJ", "TETRIS", "Granada") }.to raise_error(ArgumentError)
        end
    end

    describe '#saberPuntos' do
        it 'No existe el cliente Jorge en Granada' do
            expect{ dator.saberPuntos("Jorge", "Granada") }.to raise_error(ArgumentError)
        end
    end

    describe '#crearTienda' do
        it 'No se puede crear una tienda en Salamanca' do
            expect{ dator.crearTienda("Salamanca") }.to raise_error(ArgumentError)
        end
    end


    describe '#insertarVideojuegoTienda' do
        it 'No podemos añadir unidades del NBA porque no tenemos en el almacén' do
            expect{ dator.insertarVideojuegoTienda("Granada", "NBA") }.to raise_error(ArgumentError)
        end
    end


    describe '#obtenerMasStocks' do
        it 'No hay sede en Valencia, no podemos obtener stock de allí' do
            expect{ dator.obtenerMasStocks("Valencia") }.to raise_error(ArgumentError)
        end
    end

    describe '#eliminarVideojuego' do
        it 'No podemos eliminar unidades de COD en Granada, porque no quedan' do
            expect{ dator.eliminarVideojuego("Granada", "COD") }.to raise_error(ArgumentError)
        end
    end

end
