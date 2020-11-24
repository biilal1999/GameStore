# Netlify


## Documentación


[Aquí](https://medium.com/@thianlopezz/deploy-de-un-sitio-web-est%C3%A1co-con-netlify-bd8c168d7f23) podemos encontrar la documentación que he utilizado para la conexión de mi repositorio [GameStore](https://github.com/biilal1999/GameStore) con **Netlify**, y por ende, su despliegue continuo.



## Conexión con GitHub


Lo primero que hemos hecho ha sido conectar nuestra cuenta de **Netlify** con nuestra [cuenta de GitHub](https://github.com/biilal1999) al clickar en **Sign Up**



![NetlifyAcces](https://github.com/biilal1999/GameStore/blob/master/docs/img/NetlifyAccess.png)



Acto seguido, toca crear un *site* nuevo en *Netlify*, el cual debe estar enlazado con nuestro **repositorio GameStore de GitHub**



![NetlifyGameStore](https://github.com/biilal1999/GameStore/blob/master/docs/img/NetlifyBot.png)



Una vez hecho esto, Netlify nos proporciona un dominio por defecto, pero podemos cambiarle el nombre, y así lo hemos hecho por **https://gamestorebot.netlify.app**




## Despliegue


Configuramos el **despliegue inicial** de nuestro *site* en **Netlify** a partir de nuestro repo de *GitHub*



![Inicial](https://github.com/biilal1999/GameStore/blob/master/docs/img/NetlifyRepo.png)




## Despliegue correcto y funcionando


Para la configuración de los **deploys**, escogemos la carpeta [functions](https://github.com/biilal1999/GameStore/tree/master/functions) como directorio en el cual Netlify puede encontrar nuestros ficheros de código.



![Settings](https://github.com/biilal1999/GameStore/blob/master/docs/img/NetlifyFunctions.png)



De hecho, podemos ver en el apartado **functions** en Netlify, como se encuentra el fichero [puntos.js](https://github.com/biilal1999/GameStore/blob/master/functions/puntos.js) después de un **deploy**



![Puntos](https://github.com/biilal1999/GameStore/blob/master/docs/img/NetlifyPuntos.png)




## Despliegue continuo


Por cada `git push` que ejecutemos a nuestro repositorio en **GitHub**, Netlify hace un **despliegue automático** de dicho repositorio. Podemos ver como, por defecto, está activada esta opción en la siguiente imagen



![Continuo](https://github.com/biilal1999/GameStore/blob/master/docs/img/NetlifyContinuo.png)



Por último, les dejamos con una prueba de los despliegues que **Netlify** ha ido haciendo



![Prueba](https://github.com/biilal1999/GameStore/blob/master/docs/img/NetlifyDeploy.png)




## Nuestra función


[Aquí](https://gamestorebot.netlify.app//functions/puntos.js) pueden consultar el código de nuestra **función desplegada en Netlify**, usando como URL el sitio web que **Netlify** nos ha proporcionado.


