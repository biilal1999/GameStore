# DOCUMENTACIÓN DE NUESTRA API DISEÑADA


## Documentación


Ya que nuestra API está hecha con el framework **Sinatra**, hemos tenido que echar mano de [documentación](http://sinatrarb.com/documentation.html) de la misma.



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
