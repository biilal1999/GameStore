require_relative '../../src/Cliente.rb'
require_relative '../../src/Tienda.rb'
require_relative '../../src/Videojuego.rb'


describe Cliente do
	t = Tienda.new(Ciudades::GRANADA)
	cli = Cliente.new("Bilal", Date.new(1999, 8, 15), t)
	vi = Videojuego.new("FIFA", Date.today, 0.3, 70)
	t.addVideojuego(vi)
	t.addVideojuego(vi)
	vi = Videojuego.new("GTA", Date.today, 0.3, 40)
	t.addVideojuego(vi)

	describe '#comprarVideojuego()' do
		
		it 'cliente con fecha inválida' do
			expect{ Cliente.new("Bilal", "error", Tienda.new(Ciudades::GRANADA)) }.to raise_error(StandardError)
		end

		it 'cliente con tienda inválida' do
			expect{ Cliente.new("Bilal", Date.new(1999, 8, 15), "error") }.to raise_error(StandardError)
		end

		it 'cliente compra videojuego con éxito' do
			expect(cli.comprarVideojuego("FIFA")).to eq("Videojuego FIFA comprado con éxito para Bilal")
		end

		it 'excepción en intento de compra de un videojuego' do
			expect{ cli.comprarVideojuego("PES") }.to raise_error(ArgumentError)
		end

	end

	
	describe '#consultarPrecioFinal' do										# Testear método consultarPrecioFinal(j)  HU02 con serverless
		it 'precio final' do
			expect(cli.consultarPrecioFinal("FIFA")).to eq("El precio del FIFA era de 70 euros, pero estás de suerte! Porque tenemos para ti un 30.0% de descuento, y lo puedes conseguir por tan solo 49.0 euros")								
		end


		it 'precio final con excepción' do
			expect{ cli.consultarPrecioFinal("TEKKEN") }.to raise_error(ArgumentError)
		end
	end
end
