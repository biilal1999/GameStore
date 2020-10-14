require '../src/Tienda.rb'
require '../src/Videojuego.rb'



describe Tienda do										# Testear métodos GET básicos/unitarios de la clase 'Tienda'
	t = Tienda.new(Ciudades::GRANADA)
	vi = Videojuego.new("GTA", Date.today, 0.3, 40)
	t.addVideojuego(vi)
	t.addCiudad(Ciudades::BARCELONA)

	describe '#videojuegos' do									# Testear nombre del videojuego de instancia del array de instancias de la clase 'Videojuego'
		it 'videojuegos disponibles' do
			expect(t.obtenerVideojuegos()).to eq('| GTA |')
		end
	end


	describe '#ciudades' do										# Testear ciudad con sede del array del ENUM 'Ciudades'
		it 'sedes abiertas' do
			expect(t.obtenerSedes()).to eq('| Granada | Barcelona |')
		end
	end

end 


