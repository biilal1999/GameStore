# DOCUMENTACIÓN DE NUESTRA API DISEÑADA


## Documentación


Ya que nuestra API está hecha con el framework **Sinatra**, hemos tenido que echar mano de [documentación](http://sinatrarb.com/documentation.html) de la misma.



## Diseño de la API



### Verbos HTTP


Los vebos del protocolo **HTTP** que vamos a utilizar son los siguientes:


1. **GET**, que lo usamos cuando queremos hacer una consulta a la API y el **server** la devuelve al cliente.


2. **POST**, que lo usamos cuando queremos enviar parámetros a la API para modificar valores de sus objetos, dichos parámetros no son visibles desde una URL.


3. **DELETE**, que lo usamos cuando queremos eliminar datos almacenados de la API.




### Rutas diseñadas y cómo se ajustan a nuestras HISTORIAS DE USUARIO



> get '/' do


Con esta ruta simplemente accedemos a la página principal. Nos dirá que empecemos a usar la API cuando haya alguna tienda creada en memoria, y cuando no, 
