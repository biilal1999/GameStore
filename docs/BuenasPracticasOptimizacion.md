# Buenas prácticas en la optimización de la imagen utilizada

Como se ha explicado [aquí](https://github.com/biilal1999/GameStore/blob/master/docs/ComparativaImagenes.md), se ha utilizado al final la imagen **ruby:2.7.2-alpine**, que ya de por sí es una versión bastante ligera de tamaño.

Para optimizar un poco nuestra imagen, hemos hecho lo siguiente:

+ Para aprovechar la caché, colocamos arriba del Dockerfile las instrucciones que menos veces se van a ejecutar

+ Concatenamos instrucciones **RUN** y **COPY** en una misma para reducir las capas, utilizando **&&**

+ Eliminamos los ficheros de dependencias (**Gemfile** y **Gemfile.lock**) una vez hemos instalado las gemas

+ No copiamos a los directorios de trabajo los archivos que no vamos a necesitar


## Comentarios adicionales

Se han valorado otras opciones como utilizar **.dockerignore** pero no ha resultado rentable, ya que de primeras no hemos copiado archivos innecesarios al directorio de trabajo.

Además, se ha intentado utilizar la herramienta **squash** basándonos en alguna web como [esta](https://www.back2code.me/2020/02/squashing-docker-images/).

Pero como comprobamos en las siguientes dos capturas de pantalla, donde primero construimos la imagen de forma normal y corriente pero en la segunda utilizamos *squash*, el tamañp de la imagen no se reduce.


![Primera](https://github.com/biilal1999/GameStore/blob/master/docs/img/SquashPrimera.png)


![Segunda](https://github.com/biilal1999/GameStore/blob/master/docs/img/SquashSegunda.png)
