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


Esta capa sirve como interfaz para que
