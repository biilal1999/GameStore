require '../src/videojuego.rb'

describe Videojuego do
	vi = Videojuego.new("No se", Date.today, 0.25, 50)

	describe '#consultarDiasRestantes' do
		it 'dias restantes' do
			expect(vi.consultarDiasRestantes()).to eq(0)
		end
	end

	describe '#consultarPrecioFinal' do
		it 'precio final' do
			expect(vi.consultarPrecioFinal()).to eq(37.5)
		end
	end

	describe '#consultarMediaEdad' do
		vi.addVenta(18)
		vi.addVenta(19)
		vi.addVenta(23)
		
		it 'media de edad' do
			expect(vi.consultarMediaEdad()).to eq(20)
		end	
	end	
end

