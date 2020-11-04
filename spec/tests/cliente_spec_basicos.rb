require_relative '../../src/Cliente.rb'
require_relative '../../src/Tienda.rb'
require_relative '../../src/Videojuego.rb'


describe Cliente do
	
	cli = Cliente.new("Bilal", Date.new(1999, 8, 15), Tienda.new(Ciudades::GRANADA))
	
	describe '#initialize' do
		
		it 'objeto cliente con datos correctos' do
			expect(cli.nombre()).to eq("Bilal")
			expect((cli.fechaNacimiento()).to_s).to eq('1999-08-15')
			expect(cli.tiendaFavorita()).to be_kind_of(Tienda)
		end

		it 'objeto cliente con fecha inválida' do
			expect{ Cliente.new("Bilal", "error", Tienda.new(Ciudades::GRANADA)) }.to raise_error(ArgumentError)
		end

		it 'objeto cliente con tienda inexistente' do
			expect{ Cliente.new("Bilal", Date.new(1999, 8, 15), "error") }.to raise_error(ArgumentError)
		end
	end

	
	describe '#cambiarTiendaFavorita' do
		t = Tienda.new(Ciudades::BARCELONA)
		error = "error"

		it 'cambio de tienda con expeción' do
			expect{ cli.cambiarTiendaFavorita(error) }.to raise_error(ArgumentError)
		end

		it 'cambio de tienda correcto' do
			cli.cambiarTiendaFavorita(t)
			expect(cli.tiendaFavorita().ciudad).to eq(t.ciudad)
		end
	end

	
	describe 'obtenerMiEdad' do
		it 'edad del cliente' do
			expect(cli.obtenerMiEdad()).to eq(21)
		end
	end
end
