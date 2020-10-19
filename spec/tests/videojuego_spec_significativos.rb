require_relative '../../src/Videojuego.rb'
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


	describe '#consultarMediaEdad' do										# Tester método consultarMediaEdad() HU03
		vi.addVenta(18)
		vi.addVenta(19)
		vi.addVenta(23)
		
		it 'media de edad' do
			expect(vi.consultarMediaEdad()).to eq(20)								# Testear caso correcto
		end	

		it 'excepción de media de edad' do
			expect(vidjuego.consultarMediaEdad()).not_to be_a_kind_of(Float)					# Testear excepción
		end	

	end

end

