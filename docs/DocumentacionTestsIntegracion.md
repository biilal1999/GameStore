# Tests de integración


## Documentación


[Aquí](http://sinatrarb.com/testing.html) pueden ver la documentación que he utilizado para implementar los tests de integración en **Sinatra**.




## ¿Qué he necesitado para los tests de integración?


Hemos necesitado instalar la gema **rack/test** con nuestro manejador de dependencias **bundler**. El comando `bundle add rack/test` te lo añade al [Gemfile](https://github.com/biilal1999/GameStore/blob/master/Gemfile), y `bundle install` nos instala la gema.




## Explicación a partir de un ejemplo


Podemos ver a continuación un ejemplo:



```

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


```


En este ejemplo, emulamos que el cliente **JJ** va a compar un **FIFA en Granada**, y luego intentará comprar un **COD en Granada**. La petición, en el caso de esta ruta es por **POST**, se realiza como pueden observar de la forma `post '/comprar', datos`, ya que en este caso hay que pasar ciertos datos. Si por ejemplo fuese la ruta 


> get '/precio/:videojuego/:tienda' do


nos valdría con hacer `get /precio/FIFA/Granada`.


Una vez enviada la petición, obtenemos los parámetros de la respuesta a partir de **last_response**:


1. Con el **be_ok** comprobamos si el **status** devuelto es correcto o incorrecto según el **protocolo HTTP**.

2. Con el **content_type** analizamos para la cabecera el tipo devuelto (si es **json**, si es **html**, si es **texto plano**, etc.).

3. Con el **body** analizamos el cuerpo de la respuesta devuelta por el servidor o, dicho de forma más coloquial, lo que el usuario ve en su pantalla.



