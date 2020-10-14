require '../src/Videojuego.rb'
require 'date'


describe Videojuego do
	vi = Videojuego.new("COD", Date.new(2020, 10, 18), 0.15, 70)

	describe '#nombreVideojuego' do
		it 'nombre del videojuego' do
			expect(vi.nombreVideojuego).to eq('COD')
		end
	end


	describe '#fechaLanzamiento' do
		it 'fecha de lanzamiento' do
			expect((vi.fechaLanzamiento).to_s).to eq('2020-10-18')
		end
	end

	
	describe 
end
