# Vercel


## Documentación


La documentación que hemos utilizado para conectar nuestro [repositorio de GitHub](https://github.com/biilal1999/GameStore) con **Vercel** la podemos consultar [aquí](https://vercel.com/docs/git/vercel-for-github).



## Conexión con GitHub


Lo primero que hemos hecho al acceder a la web de **Vercel**, es conectar con nuestra [cuenta de GitHub](https://github.com/biilal1999) 


![VercelAlta](https://github.com/biilal1999/Ejercicios/blob/master/tema5/img/VercelAltaSegunda.png)



Acto seguido, damos autorización a importar desde Vercel, nuestro repositorio **GameStore**



![Access](https://github.com/biilal1999/GameStore/blob/master/docs/img/AccessVercel.png)



Una vez hecho esto, importamos la carpeta **/** de nuestro repositorio, es decir, **el directorio raíz**



![Import](https://github.com/biilal1999/GameStore/blob/master/docs/img/VercelRoot.png)




### ¿Por qué importamos todo el proyecto?


Hacemos un pequeño parón para explicar la razón por la que importamos todo el proyecto, y no solamente la carpeta donde irán las **funciones**. Importar todo el proyecto supone que por cada **deploy**, se desplegará el proyecto entero, lo cual por ejemplo, puede suponer gastar más memoria en nuestro sistema serverless, **Vercel** en este caso.


Sin embargo, hay que tener en cuenta que las funciones que vamos a desplegar posiblemente necesiten de archivos (código) que están en otras carpetas, como puede ser nuestra carpeta **src** o nuestra carpeta **spec/tests**. Es por este motivo por el que importamos el directorio **root**.




## Despliegue


Para el despliegue **correcto**, en la terminal en la carpeta local de nuestro proyecto, ejecutamos la orden `vercel`, dicha orden nos preguntará si queremos desplegar dicha carpeta y a qúe repositorio en Vercel.


![Vercel](https://github.com/biilal1999/GameStore/blob/master/docs/img/VercelInstaPrimera.png)



Ya listos para desplegar, ejecutamos `vercel --prod`



![Despliegue](https://github.com/biilal1999/GameStore/blob/master/docs/img/VercelInstaSegunda.png)




### Despliegue funcionando


Para comprobar que el despliegue funciona, podemos hacerlo desde nuestro **Dashboard**, como pueden ver en la imagen de abajo



![Dashboard](https://github.com/biilal1999/GameStore/blob/master/docs/img/VercelDashboardGame.png)




### Despliegue continuo


El despliegue continuo se puede garantizar de forma sencilla, pues por cada `git push` a nuestro repositorio, además evidentemente de actualizarse nuestro repositorio, se actualizará el [repositorio en Vercel](https://gamestore.vercel.app/)
