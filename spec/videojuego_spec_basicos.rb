require '../src/Videojuego.rb'


describe Videojuego do										# Testeamos métodos básicos de GET
	vi = Videojuego.new("COD", Date.new(2020, 10, 18), 0.15, 70)

	describe '#nombreVideojuego' do										# Nombre del videojuego
		it 'nombre del videojuego' do
			expect(vi.nombreVideojuego()).to eq('COD')
		end
	end


	describe '#fechaLanzamiento' do										# Fecha de lanzamiento
		it 'fecha de lanzamiento' do
			expect((vi.fechaLanzamiento()).to_s).to eq('2020-10-18')
		end
	end

	
	describe '#descuento' do										# Descuento
		it 'descuento sobre 1' do
			expect(vi.descuento()).to eq(0.15)
		end
	end

	
	describe '#edadesVentas' do										# Array de edades de compradores
		it 'número de ventas' do
			expect(vi.edadesVentas.length).to eq(0)
		end
	end


	describe '#precioInicial' do										# Precio inicial del juego
		it 'precio inicial del videojuego' do
			expect(vi.precioInicial()).to eq(70)
		end
	end
end
