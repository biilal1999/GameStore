require_relative '../../src/Tienda.rb'
require_relative '../../src/Videojuego.rb'
require_relative '../../src/Cliente.rb'

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

	describe '#indiceVideojuego' do
		vj = Videojuego.new("COD", Date.today, 0.5, 60)
		
		it 'índice para el FIFA' do
			expect(t.indiceVideojuego(vi)).to eq(1)						# Testear método auxiliar para HU04 con resultado correcto
		end

		it 'El COD no está en la lista' do
			expect(t.indiceVideojuego(vj)).to eq(-1)					# Testear método auxiliar para HU04 con resultado incorrecto
		end
	end


	describe '#obtenerSigCodigo' do
		taux = Tienda.new(Ciudades::VIGO)
		vidaux = Videojuego.new("PES", Date.today, 0.2, 55)
		taux.addVideojuego(vidaux)
		cli = Cliente.new("Bilal", Date.new(1999-8-15), taux)
		cli.comprarVideojuego("PES")

		it 'índice para el próximo cliente' do
			expect(taux.obtenerSigCodigo()).to eq(1)
		end
	end

end 


