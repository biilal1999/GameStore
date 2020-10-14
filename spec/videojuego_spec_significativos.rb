require '../src/Videojuego.rb'

describe Videojuego do													# Testear clase Videojuego
	vi = Videojuego.new("FIFA", Date.today, 0.25, 50)						
	vidjuego = Videojuego.new("FIFA", Date.new(2020, 10, 05), 0.25, 50)

	describe '#consultarDiasRestantes' do										# Testear método consultarDiasRestantes()  HU01
		it 'excepción de dias restantes' do
			expect(vidjuego.consultarDiasRestantes()).not_to be_a_kind_of(Numeric)					# Testear excepción
		end
		
		it 'dias restantes' do
			expect(vi.consultarDiasRestantes()).to eq(0)								# Testear caso correcto
		end
	end

	describe '#consultarPrecioFinal' do										# Testear método consultarPrecioFinal()  HU02
		it 'precio final' do
			expect(vi.consultarPrecioFinal()).to eq(37.5)								
		end
	end


	
end

