require 'sinatra'
require 'json'
require 'logger'
require_relative 'Admin.rb'
require_relative 'ArrayDator.rb'


class ApiGame < Sinatra::Base

  	fichero = File.join(File.dirname(__FILE__), './../log/bitacora.log')
  	logger = ::Logger.new(fichero)

	configure do
		@@dator = ArrayDator.new("../datos.json")
		@@admin = Admin.new(@@dator)
	end


	get '/' do
		if @@admin.existeTienda == false
			cadena = { :info => "Empiece creando una tienda para usar nuestra API, usando la petición /tienda y un parámetro ciudad por POST. Las ciudades disponibles son Granada, Madrid, Barcelona, Sevilla, Valencia, Vigo y Zaragoza"}
			status 200
			content_type 'application/json'
			cadena.to_json

		else
			logger.info "Accedo a la página principal"
			cadena = { :info => "Empiece a usar nuestra API" }
			status 200
			content_type 'application/json'
			cadena.to_json
		end
	end


	get '/precio/:videojuego/:tienda' do
		nvid = params['videojuego']
		nti = params['tienda']

		logger.info "Se ha querido consultar el precio del videojuego #{nvid} para la tienda con sede en #{nti.capitalize}"

		if @@admin.comprobarTienda(nti) == false
			status 404
			cadena = { :error => "La tienda no existe!"}
			content_type 'application/json'
			cadena.to_json

		else
			begin
				precio = @@admin.saberPrecioFinal(nvid, nti)
				status 200
				cadena = { :info => "El precio final del videojuego #{nvid} es de #{precio} euros"}
				content_type 'application/json'
				cadena.to_json

			rescue => e
				status 404
				cadena = { :error => "El videojuego #{nvid} no existe en esta tienda"}
				content_type 'application/json'
				cadena.to_json
			end
		end
	end


	get '/dias/:videojuego/:tienda' do
		nvid = params['videojuego']
		nti = params['tienda']

		logger.info "Se han querido consultar los días restantes del videojuego #{nvid} para la tienda con sede en #{nti.capitalize}"

		if @@admin.comprobarTienda(nti) == false
			status 404
			cadena = { :error => "La tienda no existe!"}
			content_type 'application/json'
			cadena.to_json

		else
			begin
				dias = @@admin.saberDiasRestantes(nvid, nti)
				status 200
				cadena = { :info => "Quedan solo #{dias} días para que salga el #{nvid}"}
				content_type 'application/json'
				cadena.to_json

			rescue => e
				status 404
				cadena = { :error => "No hay disponible un #{nvid} con fecha de salida pendiente en esta tienda"}
				content_type 'application/json'
				cadena.to_json
			end
		end
	end


	get '/edad/:videojuego/:tienda' do
		nvid = params['videojuego']
		nti = params['tienda']

		logger.info "Se han querido consultar la edad media del videojuego #{nvid} para la tienda con sede en #{nti.capitalize}"

		if @@admin.comprobarTienda(nti) == false
			status 404
			cadena = { :error => "La tienda no existe!"}
			content_type 'application/json'
			cadena.to_json

		else
			begin
				edad = @@admin.saberEdadMedia(nvid, nti)
				status 200
				cadena = { :info => "La edad media de compra para el #{nvid} es de #{edad} años"}
				content_type 'application/json'
				cadena.to_json

			rescue => e
				status 404
				cadena = { :error => "No hay ventas en esta tienda para el #{nvid}"}
				content_type 'application/json'
				cadena.to_json
			end
		end
	end


	get '/stock/:tienda' do
		nti = params['tienda']

		logger.info "Se ha querido consultar el videojuego con más unidades en stock para la tienda con sede en #{nti.capitalize}"

		if @@admin.comprobarTienda(nti) == false
			status 404
			cadena = { :error => "La tienda no existe!"}
			content_type 'application/json'
			cadena.to_json

		else
			begin
				juego = @@admin.obtenerMasStocks(nti)
				status 200
				cadena = { :info => "El videojuego con más unidades disponibles en esta tienda es el #{juego}"}
				content_type 'application/json'
				cadena.to_json

			rescue => e
				status 404
				cadena = { :error => "No hay videojuegos disponibles en esta tienda"}
				content_type 'application/json'
				cadena.to_json
			end
		end
	end


	get '/puntos/:cliente/:tienda' do
		nti = params['tienda']
		ncl = params['cliente']

		logger.info "Se ha querido consultar los puntos acumulados que tiene el cliente #{ncl.capitalize} en la tienda con sede en #{nti.capitalize}"

		if @@admin.comprobarTienda(nti) == false
			status 404
			cadena = { :error => "La tienda no existe!"}
			content_type 'application/json'
			cadena.to_json

		else
			begin
				puntos = @@admin.saberPuntos(ncl, nti)
				status 200
				cadena = { :info => "El cliente #{ncl.capitalize} tiene un total de #{puntos} puntos acumulados"}
				content_type 'application/json'
				cadena.to_json

			rescue => e
				status 404
				cadena = { :error => "El cliente #{ncl.capitalize} no está registrado en esta tienda"}
				content_type 'application/json'
				cadena.to_json
			end
		end
	end

	post '/tienda' do
		begin
			datos = JSON.parse(request.body.read)
			city = datos["ciudad"]

		rescue => e
			status 400
			cadena = { :error => "Ruta introducida incorrectamente!!!"}
			content_type 'application/json'
			cadena.to_json
		end

		begin
			if @@admin.tiendaValida(city) == false
				status 404
				cadena = { :error => "La ciudad #{city} no es válida"}
				content_type 'application/json'
				cadena.to_json

			else

				if @@admin.comprobarTienda(city) == true
					status 404
					cadena = { :error => "La ciudad #{city} ya existe. Pruebe con otra"}
					content_type 'application/json'
					cadena.to_json

				else
					@@admin.crearTienda(city)

					if @@admin.comprobarTienda(city) == true
						logger.info "Se ha añadido la tienda con sede en #{city.capitalize}"
						status 200
						cadena = { :info => "La tienda con sede en #{city} ha sido creada con éxito"}
						content_type 'application/json'
						cadena.to_json
					else
						status 400
						cadena = { :error => "No se ha podido crear la tienda"}
						content_type 'application/json'
						cadena.to_json
					end
				end
			end

		rescue => e
			status 400
			cadena = { :error => "Ruta introducida incorrectamente"}
			content_type 'application/json'
			cadena.to_json
		end
	end


	post '/nuevo' do
		datos = JSON.parse(request.body.read)
		nti = datos['tienda']
		nvi = datos['videojuego']
		ndes = datos['descuento'].to_f
		npr = datos['precio'].to_f
		npu = datos['puntos'].to_i

		if ndes < 0.0 or ndes > 1.0 or npr < 0.0 or npu < 0
			status 404
			cadena = { :error => "Datos enviados incorrectamente"}
			content_type 'application/json'
			cadena.to_json

		else

			if @@admin.comprobarTienda(nti) == false
				status 404
				cadena = { :error => "La tienda no existe!"}
				content_type 'application/json'
				cadena.to_json

			else
				begin
					@@admin.nuevoVideojuego(nvi, ndes, npr, npu, nti)
					logger.info "Se ha pedido al proveedor el videojuego #{nvi} para la tienda con sede en #{nti.capitalize}"
					status 200
					cadena = { :info => "El videojuego #{nvi} ha sido añadido al cátalogo"}
					content_type 'application/json'
					cadena.to_json

				rescue => e
					status 404
					cadena = { :error => "No se pueden encargar más unidades del videojuego #{nvi} ya que todavía quedan en stock"}
					content_type 'application/json'
					cadena.to_json
				end
			end
		end
	end


	post '/insertar' do
		datos = JSON.parse(request.body.read)
		nti = datos['tienda']
		nvi = datos['videojuego']

		if @@admin.comprobarTienda(nti) == false
			status 404
			cadena = { :error => "La tienda no existe!"}
			content_type 'application/json'
			cadena.to_json

		else
			begin

				@@admin.insertarVideojuegoTienda(nti, nvi)
				logger.info "Se ha añadido una nueva unidad al stock del videojuego #{nvi} para la tienda con sede en #{nti.capitalize}"
				status 200
				cadena = { :info => "Ha sido añadida al catálogo una nueva unidad del videojuego #{nvi}"}
				content_type 'application/json'
				cadena.to_json

			rescue => e
				status 404
				cadena = { :error => "Error al añadir una nueva unidad del videojuego #{nvi}, ya que no existe en el catálogo de la tienda"}
				content_type 'application/json'
				cadena.to_json
			end
		end
	end


	delete '/eliminar' do
		datos = JSON.parse(request.body.read)
		nti = datos['tienda']
		nvi = datos['videojuego']

		if @@admin.comprobarTienda(nti) == false
			status 404
			cadena = { :error => "La tienda no existe!"}
			content_type 'application/json'
			cadena.to_json

		else
			begin
				@@admin.eliminarVideojuego(nti, nvi)
				logger.info "Se ha eliminado una unidad del videojuego #{nvi} para la tienda con sede en #{nti.capitalize}"
				status 200
				cadena = { :info => "Ha sido eliminada una unidad del videojuego #{nvi}"}
				content_type 'application/json'
				cadena.to_json

			rescue => e
				status 404
				cadena = { :error => "No se puede eliminar el videojuego #{nvi} de la tienda porque ya no quedan unidades"}
				content_type 'application/json'
				cadena.to_json
			end
		end
	end


	post '/comprar' do
		datos = JSON.parse(request.body.read)
		nti = datos['tienda']
		nvi = datos['videojuego']
		ncl = datos['cliente']

		if @@admin.comprobarTienda(nti) == false
			status 404
			cadena = { :error => "La tienda no existe!"}
			content_type 'application/json'
			cadena.to_json

		else
			begin
				@@admin.clienteCompraVideojuego(ncl, nvi, nti)
				logger.info "El cliente #{ncl.capitalize} ha comprado en la tienda #{nti.capitalize} el videojuego #{nvi.capitalize}"
				status 200
				cadena = { :info => "El cliente #{ncl} ha comprado el videojuego #{nvi}"}
				content_type 'application/json'
				cadena.to_json

			rescue => e
				status 404
				cadena = { :error => "No hay unidades disponibles para comprar el videojuego #{nvi}"}
				content_type 'application/json'
				cadena.to_json
			end
		end
	end

end
