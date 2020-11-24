## Función desplegada en Vercel


La función que hemos desplegado en **Vercel** la hemos implementado con el lenguaje **Ruby**, el cual estamos utilizando para el desarrollo de nuestro proyecto [GameStore](https://github.com/biilal1999/GameStore). Esta función informa al cliente del precio de un videojuego buscado por su nombre.


## Documentación


La documentación sobre introducción de **funciones desplegadas en Vercel** con *Ruby* la podemos encontrar [aquí](https://vercel.com/docs/serverless-functions/supported-languages#ruby).

Y [aquí](https://vercel.com/docs/runtimes#official-runtimes/ruby) podemos ver una documentación más explicativa con ejemplos más elaborados para el mismo objetivo.



## Implementación


Se han seguido los siguientes pasos en la implementación de la función [precio.rb](https://github.com/biilal1999/GameStore/blob/master/api/precio.rb):


1. Hacemos `require 'json'` para poder trabajar con archivos **JSON**

2. Definimos una función **Handler**, es decir, manejadora de **peticiones HTTP**, y como parámetros de petición y respuesta, **req** y **res**, respectivamente.

3. Con `req.query` obtenemos los valores pasados por **GET** a la función, es decir, en la *cabecera HTTP*.

4. Comprobamos si se ha pasado la variable por parámetro, aprovechando así para que, en caso de que no se haya efectuado el **paso por GET**, se cree ya un array con un mensaje de error.

5. Si se ha pasado por parámetro, leemos utilizando la clase **FILE**, la información del archivo [info.json](https://github.com/biilal1999/GameStore/blob/master/api/info.json).

6. Con `JSON.parse` parseamos el archivo **.json**

7. En dicho archivo, buscamos el nombre del videojuego, pasado como parámetro GET. Usamos `casecmp` para comparar cadenas sin tener en cuenta **mayúsculas ni minúsculas**.

8. En caso de que no esté el videojuego en el **array de videojuegos** de **info.json**, devolvemos array con mensaje de error.

9. En caso de que sí esté, buscamos su **precio inicial y su porcentaje de descuento** en el propio array de información; y ya según si tiene o no descuento, devolvemos el precio de una forma u otra.

10. Por último, utilizamos el parámetro de la función **res** para devolver el resultado. Con un **código de estado = 200**, equivalente a **OK** en el protocolo **HTTP**, con formato **json** e incluyendo en el *body*, el array resultado convertido a **json** utilizando `to_json`. 



## Integración dentro de mi proyecto


Esta función referencia a nuestra [HU02](https://github.com/biilal1999/GameStore/issues/13).

En nuestro fichero de la clase [Cliente.rb](https://github.com/biilal1999/GameStore/blob/master/src/Cliente.rb), dentro de nuestro método 


< consultarPrecioFinal(j) ,


hacemos uso de
