# DOCUMENTACIÓN DE NUESTRA API DISEÑADA


## Documentación


Ya que nuestra [Api.rb](https://github.com/biilal1999/GameStore/blob/master/src/Api.rb) está hecha con el framework **Sinatra**, hemos tenido que echar mano de [documentación](http://sinatrarb.com/documentation.html) de la misma.



## Diseño de la API



### Estados HTTP


Los diferentes **status** que hemos usado son:


1. 200 , cuando la petición se ha resuelto de forma satisfactoria => **OK**

2. 400 , cuando los parámetros enviados, en nuestro caso por **POST**, se han nombrado de forma incorrecta => **ERROR**

3. 404, cuando no se han podido encontrar los parámetros enviados por petición **GET** al server => **ERROR**



### Tipos devueltos por la API


Cuando devolvamos la información al cliente, además de devolver el **status** correspondiente, devolveremos una cadena en formato **JSON** especificándolo con `content_type application/json`.

Si el status es correcto, la cadena JSON lleva la clave **info**; y si es incorrecto, la cadena JSON lleva la clave **error**.



### Verbos HTTP


Los vebos del protocolo **HTTP** que vamos a utilizar son los siguientes:


1. **GET**, que lo usamos cuando queremos hacer una consulta a la API y el **server** la devuelve al cliente.


2. **POST**, que lo usamos cuando queremos enviar parámetros a la API para modificar valores de sus objetos, dichos parámetros no son visibles desde una URL.


3. **DELETE**, que lo usamos cuando queremos eliminar datos almacenados de la API.




### Rutas diseñadas y cómo se ajustan a nuestras HISTORIAS DE USUARIO



**Aclaración**: Siempre que veamos el parámetro *:tienda* en la ruta, deberemos especificar **la sede de la tienda**; cuando veamos el parámetro *:videojuego* especificaremos **el nombre del videojuego**; y con el parámetro *:cliente*, **el nombre del cliente**.


En Sinatra, los parámetros en la **QUERY STRING** acompañan con *:*


En todos los métodos siguientes comprobamos si existen **los datos enviados por parámetro**, y en caso de que no existan, devolvemos un mensaje de error con su status correspondiente informando de el porqué.


> get '/' do


Con esta ruta simplemente accedemos a la página principal. Nos dirá que empecemos a usar la API cuando haya alguna tienda creada en memoria, y cuando no, que creemos una tienda.



> get '/precio/:videojuego/:tienda' do



Con esta ruta solicitamos saber el precio final de un videojuego en una tienda determinada, a partir del nombre del videojuego y la sede de la tienda. Está relacionada con la [HU02](https://github.com/biilal1999/GameStore/issues/13)



> get '/dias/:videojuego/:tienda' do



Con esta ruta solicitamos saber los días restantes para la salida de un videojuego en una tienda determinada, a partir del nombre del videojuego y la sede de la tienda. Está relacionada con la [HU01](https://github.com/biilal1999/GameStore/issues/12)




> get '/edad/:videojuego/:tienda' do



Con esta ruta solicitamos saber la edad media de compra de un videojuego en una tienda determinada, a partir del nombre del videojuego y la sede de la tienda. Está relacionada con la [HU03](https://github.com/biilal1999/GameStore/issues/14)




> get '/stock/:tienda' do



Con esta ruta solicitamos saber el videojuego con más unidades en **stock** de una tienda determinada, a partir de la sede de la tienda. Está relacionada con la [HU04](https://github.com/biilal1999/GameStore/issues/45)




> get '/puntos/:cliente/:tienda' do



Con resta ruta solicitamos saber los puntos que tiene acumulados un determinado **cliente** en una tienda, a partir de la sede de la tienda y del nombre del cliente. Está relacionada con la [HU06](https://github.com/biilal1999/GameStore/issues/82)




> post '/tienda' do



Con resta ruta buscamos añadir una nueva tienda a **GameStore**, a partir de la sede de la tienda, enviado por **POST**. Está relacionada con la [HU11](https://github.com/biilal1999/GameStore/issues/96)




> post '/nuevo' do



Con resta ruta buscamos añadir un videojuego **que no teníamos**, al almacén, a partir del nombre del videojuego y de la sede de la tienda, enviado por **POST**. Está relacionada con la [HU10](https://github.com/biilal1999/GameStore/issues/95)




> post '/insertar' do



Con resta ruta buscamos incrementar una unidad en stock de un videojuego **que sí teníamos**, a partir del nombre del videojuego y de la sede de la tienda, enviado por **POST**. Está relacionada con la [HU08](https://github.com/biilal1999/GameStore/issues/91)




> post '/comprar' do



Con esta ruta buscamos que un cliente pueda comprar un videojuego en una tienda, a partir del nombre del cliente, del nombre del videojuego y de la sede de la tienda, enviado todo por **POST**. Está relacionada con la [HU05](https://github.com/biilal1999/GameStore/issues/64)




> delete '/eliminar' do



Con esta ruta buscamos eliminar una unidad de un videojuego de una tienda determinada, ambas cosas enviadas al **server** por **DELETE**. Está relacionada con la [HU07](https://github.com/biilal1999/GameStore/issues/89) .




## Diseño por capas



Además del fichero [Api.rb](https://github.com/biilal1999/GameStore/blob/master/src/Api.rb), también tenemos para esta **API** los ficheros:


+ [Admin.rb](https://github.com/biilal1999/GameStore/blob/master/src/Admin.rb)

+ [ArrayDator.rb](https://github.com/biilal1999/GameStore/blob/master/src/ArrayDator.rb)

+ [Dator.rb](https://github.com/biilal1999/GameStore/blob/master/src/Dator.rb)




### Capa de datos


En esta capa es donde **se acceden a los datos figurados en fuentes externas**. Nosotros para esta API que hemos hecho, simplemente leemos datos de un **JSON** ([datos.json](https://github.com/biilal1999/GameStore/blob/master/datos.json)), no escribimos en él. 


Nuestra clase [Dator.rb](https://github.com/biilal1999/GameStore/blob/master/src/Dator.rb) define métodos sin implementar, del cuál heredarán diversas clases para implementarlos.


Nuestra clase [ArrayDator.rb](https://github.com/biilal1999/GameStore/blob/master/src/ArrayDator.rb) hereda de **Dator.rb** e implementa sus métodos. Esta clase se encarga de:


1. Leer del archivo **JSON** anteriormente enlazado

2. Almacenar esa información en estructuras de datos guardadas en memoria (**NO PERSISTENCIA**), en concreto en un **array** (de ahí el nombre **ArrayDator**). 

3. Modificar esas estructuras de datos almacenadas en memoria con la información que el usuario envíe de acuerdo con las **rutas** anteriormente explicadas.

4. Conectar con las clases de nuestro proyecto y, aprovechar sus métodos implementados para realizar las distintas operaciones.


Ejemplo:


```

def obtenerMasStocks(ciudad)
        t = encontrarTienda(ciudad)

        if t.nil?
            raise ArgumentError.new("No existe tienda en #{ciudad}")
        end
        
        juego = t.masMuestras

        return juego
end


```


Donde obtenemos el objeto **t** de la clase **Tienda** correspondiente a la ciudad pasada como parámetro (gracias a nuestra información en las estructuras de datos), y utilizar el método `masMuestras()` de la clase [Tienda.rb](https://github.com/biilal1999/GameStore/blob/master/src/Tienda.rb) para obtener lo que deseamos.




### Capa de lógica de negocio


Esta capa sirve como interfaz para que nuestra **capa de aplicación** conecte con nuestra **capa de acceso a datos**. Para llevar esto a cabo, hemos implementado una clase manejadora [Admin.rb](https://github.com/biilal1999/GameStore/blob/master/src/Admin.rb) .


En **Admin.rb** simplemente crearemos una instancia **@dator** de **ArrayDator.rb** , y en los métodos (que tienen la misma cabecera que su correspondiente en la clase dateadora), llamaremos a los de la clase dateadora. Como explicado así suena un poco lioso, vamos a ver un ejemplo:



```

def obtenerMasStocks(ciudad)
        @dator.obtenerMasStocks(ciudad)
end


```



### Capa de aplicación


Esta capa es la correspondiente a nuestra [Api.rb](https://github.com/biilal1999/GameStore/blob/master/src/Api.rb) , que como hemos explicado anteriormente implementa las distintas rutas de nuestra **API**, y dentro de ellas, hace uso de una instancia de la **clase manejadora** para obtener, a partir de los datos almacenados en memoria, lo que se va a devolver al **cliente web**.






## Buenas prácticas


### Logs


Para cumplir con la [HU09](https://github.com/biilal1999/GameStore/issues/94) hemos empezando instalando, haciendo uso de nuestro manejador de dependencias **bundler**, la gema **logger**, con `bundle add logger` para añadirlo a nuestro [Gemfile](https://github.com/biilal1999/GameStore/blob/master/Gemfile), y luego instalándola con `bundle install`. 


Después, en el bloque


> configure do             end


, que dicho bloque en el código especifica que las líneas de código pertenecientes se ejecutan tanto en **desarrollo como en produccón**, usamos la clase **Logger** para generar así un *log*, y especificamos que la salida será en la **terminal** con el comando `Logger.new(STDOUT)`. 


Ya simplemente, en cada ruta definida en **Api.rb**, con `logger.info "algo"` nos imprimiría en la terminal "algo".


**Aclaración**: De primeras, habíamos hecho la salida en un fichero **log**, pero no hemos continuado con esta opción porque me daba un problema de permisos para escribir en él, ya que tenemos programado nuestro [Dockerfile](https://github.com/biilal1999/GameStore/blob/master/Dockerfile) que los **tests los ejecuta un usuario sin permisos de root**. 



### Middleware


Hemos implementado la clase [MiddlewareRuta.rb](https://github.com/biilal1999/GameStore/blob/master/src/MiddlewareRuta.rb). Esta clase hace uso de la gema **rack**. Rack es una interfaz que proporciona ya algunos *middlewares* para hacer uso de ellos. 

Nosotros, haciendo uso de **Rack**, hemos implementado un **middleware** que analiza cada ruta HTTP pedida por el cliente web, de tal forma de que si por ejemplo el cliente envía al servidor una ruta **INCOMPLETA** por **GET**, el server le devolverá al cliente un mensaje en **texto plano** informando de que debe completar la petición con los parámetros correspondientes para hacer la consulta. De nuevo, vemos un ejemplo.


Pongamos que el usuario hace la petición `curl http://localhost:9292/precio` , ya sabemos que la ruta es incompleta porque no hemos pasado los parámetros a buscar, ni del **videojuego** ni de la **tienda**. Entonces, se ejecutará lo siguiente:


```

def call(env)
        status, headers, response = @midd.call(env)

        if env['REQUEST_PATH'] == '/precio' or env['REQUEST_PATH'] == '/dias' or env['REQUEST_PATH'] == '/edad' or env['REQUEST_PATH'] == '/stocks' or env['REQUEST_PATH'] == '/puntos'
            cad = StringIO.new("Debe completar la url #{env['REQUEST_PATH']} con lo necesario para realizar la consulta")
            h = {"Content-Type" => "text/plain"}
            [status, h, cad]

        else
            [status, headers, response]
        end
end

```


Donde obtenemos de **env** el **status**, **header** y **response** de la respuesta a enviar al cliente web. Si la ruta es incompleta, se modificará el **header** y el **response** para informar, por texto plano, al cliente de que debe completar la ruta **env['REQUEST_PATH']**.



Hay que tener en cuenta que el **midleware** se ejecuta siempre, en cada llamada a la **API**, con lo cuál entrará a analizar todas las rutas enviadas.. Esto se hace declarando el comando `use MiddlewareRuta` en **Api.rb**.


Si la petición sí tiene la ruta completa, se devuelve exactamente lo que devolvería si no tuviésemos nuestro **middleware**.
