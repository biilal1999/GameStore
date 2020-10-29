require_relative '../../src/Tienda.rb'
require_relative '../../src/Videojuego.rb'

describe Tienda do										# Testear métodos GET básicos/unitarios de la clase 'Tienda'
	t = Tienda.new(Ciudades::GRANADA)
	vi = Videojuego.new("GTA", Date.today, 0.3, 40)
	t.addVideojuego(vi)
	vi = Videojuego.new("FIFA", Date.today, 0.3, 70)
	t.addVideojuego(vi)

	describe '#videojuegos' do									# Testear nombre del videojuego de instancia del array de instancias de la clase 'Videojuego'
		it 'videojuegos disponibles' do
			expect(t.obtenerVideojuegos()).to eq(["GTA", "FIFA"])
		end
	end


	describe '#ciudades' do										# Testear ciudad con sede del array del ENUM 'Ciudades'
		it 'sede de la tienda' do
			expect(t.ciudad).to eq(:Granada)
		end
	end

	vh = Videojuego.new("FIFA", Date.today, 0.3, 70)
	t.addVideojuego(vh)

	describe '#masMuestras' do									
		it 'videojuego con más muestras' do							# Testear método para HU04 resultado correcto
			expect(t.masMuestras()).to eq("FIFA")
		end
	end

	describe '#masMuestras' do
		tienda = Tienda.new(Ciudades::BARCELONA)
		
		it 'excepción de más muestras' do							# Testear excepción para HU04
			expect{ tienda.masMuestras() }.to raise_error(StandardError)
		end
	end

end 


