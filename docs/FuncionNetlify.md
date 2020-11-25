# Función desplegada en Netlify


La función que hemos desplegado en **Netlify** la hemos implementado con el lenguaje de programación **Node**, el cual **NO** es el que estamos usando para el desarrollo de nuestro proyecto [GameStore](https://github.com/biilal1999/GameStore). Esta función informa a un administrador de tienda de la cantidad de puntos acumulados que tiene un cliente determinado.



## Documentación


[Aquí](https://www.netlify.com/blog/2018/09/13/how-to-run-express.js-apps-with-netlify-functions/) podemos ver una documentación que nos proporciona ejemplos sobre cómo programar funciones en **Node** que desplegaremos en **Netlify**.


Además, [aquí](https://levelup.gitconnected.com/create-your-own-telegram-bot-and-send-and-receive-messages-via-nodejs-c0954928a8c4) podemos ver una guía sobre cómo integrar funciones desarrolladas en **Node con un bot de Telegram**.


La guía sobre cómo usar el **webhook** la podemos encontrar [aquí](https://medium.com/@xabaras/setting-your-telegram-bot-webhook-the-easy-way-c7577b2d6f72)



## Implementación


Se han seguido los siguientes pasos para la implementación de la función [puntos.js](https://github.com/biilal1999/GameStore/blob/master/functions/puntos.js):


1. Hacemos un `require` del fichero [info.json](https://github.com/biilal1999/GameStore/blob/master/functions/info.json) donde tenemos toda la información:

2. Definimos una función auxiliar, que a partir del nombre de un cliente, devolvería una cadena con error o información de los puntos obtenidos según cada caso. Esta función, además, utiliza el **array de información obtenido en el paso anterior**, para hacer sus correspondientes búsquedas.

3. Definimos una función **Handler**, es decir, manejadora de **peticiones HTTP**, y cuyo parámetro es **event**, el cuál contiene la información enviada del emisor al receptor en formato *JSON*

4. Ahora viene la parte de **integración con un bot de Telegram**, el cual explicaremos más adelante.

5. Comprobamos el comando enviado por el usuario de Telegram, y según cada caso, almacenamos en **la variable cadena** una respuesta u otra.

6. Con `return` devolvemos la información al usuario de Telegram utilizando **statusCode** e igualándolo a 200, lo que se traduce en **OK para el protocolo HTTP**, además con **headers -> application/json** especificamos las cabeceras de la respuesta; y el cuerpo irá en **body**, utilizando ahí `JSON.stringify` para transformar el array a formato **json**.




## Integración con un Bot de Telegram


Para integrar esta función con un **bot de Telegram**, en el código de la propia función, una vez obtenemos el cuerpo del mensaje a partir del parámetro event, hacemos lo siguiente:


1. Después de haber parseado el **JSON recibido en event** a un array msg, con `msg.message.text` obtenemos el comando que nos ha enviado el usuario de Telegra.

2. De la misma forma, con `msg.message.chat.id` obtenemos el **id del chat** de Telegram que nos lo ha enviado, lo cual será muy importante a la hora de la devolución.

3. Para devolver la información al usuario de Telegram, siguiendo la guía de la documentación mencionada anteriormente, devolvemos un array con **text** donde irá alojado el mensaje a devolver, es decir, lo que el usuario normal ve; **method** donde especificamos `sendMessage` para referirnos a que vamos a efecutar el envío de un mensaje; y por último, **chat_id** donde almacenamos el id del chat de Telegram que corresponde con el usuario que nos ha enviado y al que le vamos a devolver la información.



### ¿Cómo creamos el bot de Telegram?


Haciendo uso de [BotFather](https://telegram.me/BotFather) podemos crear nuestro **bot de Telegram**, siguiendo fácilmente sus comandos como `\newbot`.



### ¿Webhook? ¿Para qué lo utilizamos?


Nuestro bot no tiene de momento ninguna acción definida. Es decir, si le mandamos un comando no hará nada, porque no le hemos explicado qué debe hacer.


Para eso sirve el **WEBHOOK**, pues escribiendo en la **URL de nuestro navegador lo siguiente:


> https://api.telegram.org/bot{miTokenBot}?url=https://gamestorebot.netlify.app/.netlify/functions/puntos



, esto hará que cuando se escriba un comando, se vaya a ejecutar la fucion **handler** (porque es la que maneja eventos HTTP), de la función pasada como parámetro **GET** (url) que hemos escrito en nuestro navegador. 


También ponemos nuestro **TOKEN del bot** que nos ha proporcionado **BotFather** cuando hemos creado el bot, pero en esta documentación no vamos a poner el token literalmente para evitar que alguna persona pueda cambiar la acción de nuestro **bot**.



### ¿Quieres usar nuestro bot?


Puedes comprobar si lo deseas el funcionamiento de nuestro bot [PuntosGameBot](https://t.me/PuntosGameBot)




## Integración con nuestro proyecto


Hemos integrado esta función con nuestro proyecto de forma que corresponde a nuestra [HU06](https://github.com/biilal1999/GameStore/issues/82).


Esta historia de usuario, que hemos creado para este hito, consiste en que un administrador de tienda pueda, con el nombre de un cliente, obtener la información de sus puntos obtenidos al comprar videojuegos.


Hemos añadido a la clase [Videojuego.rb](https://github.com/biilal1999/GameStore/blob/master/src/Videojuego.rb), un atributo **puntos** para almacenar los puntos de un videojuego. Ademas, hemos modificado el método de la clase [Tienda.rb](https://github.com/biilal1999/GameStore/blob/master/src/Tienda.rb)


> venderProducto(cli, vj)


para que añada los puntos obtenidos al cliente una vez se le haya vendido el **videojuego**.




### Uso de Node con ¿dependencias?


Hemos utilizado **Node** como lenguaje para implementar esta función, pero no nos ha hecho falta los ficheros de dependencias **package.json** y **package-lock.json**, que corresponderían respectivamente con [Gemfile](https://github.com/biilal1999/GameStore/blob/master/Gemfile) y [Gemfile.lock](https://github.com/biilal1999/GameStore/blob/master/Gemfile.lock) para **Ruby**, puesto que no hemos necesitado dependencias de **Node** a la hora de implementar esta función.
