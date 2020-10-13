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
	
end

