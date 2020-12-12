require_relative '../../src/Api.rb'
require 'rack/test'


describe ApiGame do
    include Rack::Test::Methods

    def app
        ApiGame
    end


    describe '#endPointPrincipal' do
        it 'Ya hay tiendas creadas' do
            get '/'
            expect(last_response).to be_ok
            expect(last_response.content_type).to eq('application/json')
            expect(last_response.body).to eq(({:info => "Empiece a usar nuestra API"}).to_json)
        end
    end


    describe '#consultarElPrecioFinalVideojuego' do
        it 'El FIFA cuesta 49 euros' do
            get '/precio/fifa/granada'
            expect(last_response).to be_ok
            expect(last_response.content_type).to eq('application/json')
            expect(last_response.body).to eq(({:info => "El precio final del videojuego fifa es de 49.0 euros"}).to_json)

        end

        it 'El CS no lo tenemos' do
            get '/precio/cs/granada'
            expect(last_response).to_not be_ok
            expect(last_response.content_type).to eq('application/json')
            expect(last_response.body).to eq(({:error => "El videojuego cs no existe en esta tienda"}).to_json)
        end
    end


    describe '#consultarDiasRestantesVideojuego' do
        it 'Quedan días para el GTA' do
            get '/dias/gta/granada'
            expect(last_response).to be_ok
            expect(last_response.content_type).to eq('application/json')
            expect(last_response.body).to_not eq(({:error => "No hay disponible un gta con fecha de salida pendiente en esta tienda"}).to_json)

        end

        it 'Ya salió el LOL' do
            get '/dias/lol/granada'
            expect(last_response).to_not be_ok
            expect(last_response.content_type).to eq('application/json')
            expect(last_response.body).to eq(({:error => "No hay disponible un lol con fecha de salida pendiente en esta tienda"}).to_json)
        end
    end


    describe '#consultarMediaEdadlVideojuego' do
        it '21 años de media' do
            get '/edad/fifa/granada'
            expect(last_response).to be_ok
            expect(last_response.content_type).to eq('application/json')
            expect(last_response.body).to eq(({:info => "La edad media de compra para el fifa es de 21.0 años"}).to_json)

        end

        it 'No se ha vendido el GTA en Barcelona' do
            get '/edad/gta/barcelona'
            expect(last_response).to_not be_ok
            expect(last_response.content_type).to eq('application/json')
            expect(last_response.body).to eq(({:error => "No hay ventas en esta tienda para el gta"}).to_json)
        end
    end


    describe '#consultarMasStocks' do
        it 'El FIFA en Granada' do
            get '/stock/granada'
            expect(last_response).to be_ok
            expect(last_response.content_type).to eq('application/json')
            expect(last_response.body).to eq(({:info => "El videojuego con más unidades disponibles en esta tienda es el FIFA"}).to_json)

        end
    end


    describe '#consultarPuntosCliente' do
        it 'El FIFA cuesta 49 euros' do
            get '/puntos/bilal/granada'
            expect(last_response).to be_ok
            expect(last_response.content_type).to eq('application/json')
            expect(last_response.body).to eq(({:info => "El cliente Bilal tiene un total de 17 puntos acumulados"}).to_json)

        end

        it 'No tenemos a Juan en la tienda' do
            get '/puntos/juan/granada'
            expect(last_response).to_not be_ok
            expect(last_response.content_type).to eq('application/json')
            expect(last_response.body).to eq(({:error => "El cliente Juan no está registrado en esta tienda"}).to_json)
        end
    end


    describe '#crearTienda' do
        it 'Se crea la tienda en Vigo' do
            datos = ({"ciudad": "Vigo"}).to_json
            post '/tienda', datos
            expect(last_response).to be_ok
            expect(last_response.content_type).to eq('application/json')
            expect(last_response.body).to eq(({:info => "La tienda con sede en Vigo ha sido creada con éxito"}).to_json)

        end

        it 'No se puede crear tienda en Huelva' do
            datos = ({"ciudad": "Huelva"}).to_json
            post '/tienda', datos
            expect(last_response).to_not be_ok
            expect(last_response.content_type).to eq('application/json')
            expect(last_response.body).to eq(({:error => "La ciudad Huelva no es válida"}).to_json)
        end

        it 'Ya hay una tienda en Barcelona' do
            datos = ({"ciudad": "Barcelona"}).to_json
            post '/tienda', datos
            expect(last_response).to_not be_ok
            expect(last_response.content_type).to eq('application/json')
            expect(last_response.body).to eq(({:error => "La ciudad Barcelona ya existe. Pruebe con otra"}).to_json)
        end
    end


    describe '#nuevoVideojuego' do
        it 'Se añade el Tekken' do
            datos = ({"tienda": "Granada", "videojuego": "Tekken", "descuento": "0.2", "precio": "27", "puntos": "4"}).to_json
            post '/nuevo', datos
            expect(last_response).to be_ok
            expect(last_response.content_type).to eq('application/json')
            expect(last_response.body).to eq(({:info => "El videojuego Tekken ha sido añadido al cátalogo"}).to_json)

        end

        it 'Todavía quedan FIFAs' do
            datos = ({"tienda": "Granada", "videojuego": "FIFA", "descuento": "0.2", "precio": "27", "puntos": "4"}).to_json
            post '/nuevo', datos
            expect(last_response).to_not be_ok
            expect(last_response.content_type).to eq('application/json')
            expect(last_response.body).to eq(({:error => "No se pueden encargar más unidades del videojuego FIFA ya que todavía quedan en stock"}).to_json)
        end
    end


    describe '#añadirUnidad' do
        it 'Añadimos otro FIFA' do
            datos = ({"tienda": "Granada", "videojuego": "FIFA"}).to_json
            post '/insertar', datos
            expect(last_response).to be_ok
            expect(last_response.content_type).to eq('application/json')
            expect(last_response.body).to eq(({:info => "Ha sido añadida al catálogo una nueva unidad del videojuego FIFA"}).to_json)

        end

        it 'No podemos añadir otro overwatch, están agotados' do
            datos = ({"tienda": "Granada", "videojuego": "OVERWATCH"}).to_json
            post '/insertar', datos
            expect(last_response).to_not be_ok
            expect(last_response.content_type).to eq('application/json')
            expect(last_response.body).to eq(({:error => "Error al añadir una nueva unidad del videojuego OVERWATCH, ya que no existe en el catálogo de la tienda"}).to_json)
        end
    end


    describe '#eliminarVideojuego' do
        it 'Eliminamos un FIFA' do
            datos = ({"tienda": "Granada", "videojuego": "FIFA"}).to_json
            delete '/eliminar', datos
            expect(last_response).to be_ok
            expect(last_response.content_type).to eq('application/json')
            expect(last_response.body).to eq(({:info => "Ha sido eliminada una unidad del videojuego FIFA"}).to_json)

        end

        it 'No podemos eliminar un OVERWATCH' do
            datos = ({"tienda": "Granada", "videojuego": "OVERWATCH"}).to_json
            delete '/eliminar', datos
            expect(last_response).to_not be_ok
            expect(last_response.content_type).to eq('application/json')
            expect(last_response.body).to eq(({:error => "No se puede eliminar el videojuego OVERWATCH de la tienda porque ya no quedan unidades"}).to_json)
        end
    end

    describe '#comprarVideojuego' do
        it 'JJ va a comprar el FIFA' do
            datos = ({"tienda": "Granada", "videojuego": "FIFA", "cliente": "JJ"}).to_json
            post '/comprar', datos
            expect(last_response).to be_ok
            expect(last_response.content_type).to eq('application/json')
            expect(last_response.body).to eq(({:info => "El cliente JJ ha comprado el videojuego FIFA"}).to_json)

        end

        it 'JJ no puede comprar el COD' do
            datos = ({"tienda": "Granada", "videojuego": "COD", "cliente": "JJ"}).to_json
            post '/comprar', datos
            expect(last_response).to_not be_ok
            expect(last_response.content_type).to eq('application/json')
            expect(last_response.body).to eq(({:error => "No hay unidades disponibles para comprar el videojuego COD"}).to_json)
        end
    end
end
