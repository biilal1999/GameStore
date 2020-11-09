# Uso del contenedor Docker en alguno de los sistemas de integración continua


Dado que en el hito anterior construíamos imágenes de Docker a partir de nuestro [Dockerfile](https://github.com/biilal1999/GameStore/blob/master/Dockerfile), aprovecharemos nuestro contenedor de Docker para ejecutar los tests, ya que recordemos que en la construcción de las imágenes se instalan las dependencias (**rspec** y **rake**), y lleva la orden `CMD ["rake", "test"]`.


Este aprovechamiento del contenedor de **Docker** nos ahorrará el tener que especificar múltiples versiones de **Ruby** para las diversas compilaciones, ya que en el *Dockerfile* especificamos que la imagen es **ruby:2.7.2-alpine**.


Pero antes de nada...


## ¿Por qué descargar la imagen y no construirla?


En un primer momento, podemos pensar en utilizar el comando `docker build -t gamestore .` para **construir una imagen de nuestro contenedor** a partir de nuestro *Dockerfile*. ¿Esto funcionaría? Por supuesto que sí, pero sin embargo, no es lo más idóneo para aprovechar nuestro contenedor.


Recordemos que en el hito anterior, enlazamos nuestro [repositorio de GitHub](https://github.com/biilal1999/GameStore) con nuestro [repositorio de Docker Hub](https://hub.docker.com/r/biilal1999/gamestore), con lo cual nuestro [Dockerfile](https://github.com/biilal1999/GameStore/blob/master/Dockerfile) siempre estará actualizado en **Docker Hub**, tal y como se puede consultar en el [Dockerfile de Docker Hub](https://hub.docker.com/r/biilal1999/gamestore/dockerfile).


Una vez explicado todo esto, podemos llegar a la conclusión de que si no cambiamos nuestro *Dockerfile*, no tenemos porqué rehacer el *build* a nuestro contenedor, así que lo más lógico para **aprovechar** el contenedor del Docker es directamente **descargar la última imagen construida** de *Docker Hub*, puesto que ha sido construida a partir del *Dockerfile* más actualizado.


## Travis CI


En nuestro [.travis.yml](https://github.com/biilal1999/GameStore/blob/master/.travis.yml) usamos el lenguaje **minimal**, ya que nos instala lo justo y necesario (el servicio Docker, entre otros). El aprovechamiento de Docker lo llevamos a cabo descargando la imagen de nuestro [repositorio de Docker Hub](https://hub.docker.com/r/biilal1999/gamestore)


> docker pull biilal1999/gamestore


, que podemos ver instalada correctamente con


> docker images


, la cual nos instala nuestras dependencias, y ejecutando dicha imagen conseguiremos ejecutar los tests, haciendo así uso del **task runner**.


> docker run -t -v `pwd`:/test biilal1999/gamestore:latest




## Shippable


En nuestro [shippable.yml](https://github.com/biilal1999/GameStore/blob/master/shippable.yml) no usamos *Docker* para utilizar el **task runner**, sino que lo hacemos como está explicado [aquí](https://github.com/biilal1999/GameStore/blob/master/docs/UsoTaskRunner.md#shippable).



