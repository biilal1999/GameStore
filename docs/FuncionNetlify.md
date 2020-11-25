# Función desplegada en Netlify


La función que hemos desplegado en **Netlify** la hemos implementado con el lenguaje de programación **Node**, el cual **NO** es el que estamos usando para el desarrollo de nuestro proyecto [GameStore](https://github.com/biilal1999/GameStore). Esta función informa a un administrador de tienda de la cantidad de puntos acumulados que tiene un cliente determinado.



## Documentación


[Aquí](https://www.netlify.com/blog/2018/09/13/how-to-run-express.js-apps-with-netlify-functions/) podemos ver una documentación que nos proporciona ejemplos sobre cómo programar funciones en **Node** que desplegaremos en **Netlify**.



## Implementación


Se han seguido los siguientes pasos para la implementación de la función [puntos.js](https://github.com/biilal1999/GameStore/blob/master/functions/puntos.js):


1. Hacemos un `require` del fichero [info.json](https://github.com/biilal1999/GameStore/blob/master/functions/info.json) donde tenemos toda la información:

2. Definimos una función auxiliar, que a partir del nombre de un cliente, devolvería una cadena con error o información de los puntos obtenidos según cada caso. Esta función, además, utiliza el **array de información obtenido en el paso anterior**, para hacer sus correspondientes búsquedas.

3. Definimos una función **Handler**, es decir, manejadora de **peticiones HTTP**, y cuyo parámetro es **event**, el cuál contiene la información enviada del emisor al receptor en formato *JSON*

4. Ahora viene la parte de **integración con un bot de Telegram**, el cual explicaremos más adelante.

5. Comprobamos el comando enviado por el usuario de Telegram, y según cada caso, almacenamos en **la variable cadena** una respuesta u otra.

6. Con `return` devolvemos la información al usuario de Telegram utilizando **statusCode** e igualándolo a 200, lo que se traduce en **OK para el protocolo HTTP**, además con **headers -> application/json** especificamos las cabeceras de la respuesta; y el cuerpo irá en **body**, utilizando ahí `JSON.stringify` para transformar el array a formato **json**.





