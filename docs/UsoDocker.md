# Uso del contenedor Docker en alguno de los sistemas de integración continua


Dado que en el hito anterior construíamos imágenes de Docker a partir de nuestro [Dockerfile](https://github.com/biilal1999/GameStore/blob/master/Dockerfile), aprovecharemos nuestro contenedor de Docker para ejecutar los tests, ya que recordemos que en la construcción de las imágenes se instalan las dependencias (**rspec** y **rake**), y lleva la orden `CMD ["rake", "test"]`.


Este aprovechamiento del contenedor de **Docker** nos ahorrará el tener que especificar múltiples versiones de **Ruby** para las diversas compilaciones, ya que en el *Dockerfile* especificamos que la imagen es **ruby:2.7.2-alpine**.



## Travis CI


En nuestro [.travis.yml](https://github.com/biilal1999/GameStore/blob/master/.travis.yml) usamos el lenguaje **minimal**, ya que nos instala lo justo y necesario (el servicio Docker, entre otros). El aprovechamiento de Docker lo llevamos a cabo construyendo la imagen


> docker build -t gametrav .


, lo cual nos instala nuestras dependencias, y ejecutando dicha imagen conseguiremos ejecutar los tests, haciendo así uso del **task runner**.


> docker run -t -v `pwd`:/test gametrav:latest



## GitHub Actions


En nuestro [githubActions.yml](https://github.com/biilal1999/GameStore/blob/master/.github/workflows/githubActions.yml) el aprovechamiento de **Docker** lo hacemos como en *Travis* (usando así el **task runner**). 

La diferencia de que añadimos paso que hace **push a GitHub Container Registry**, para que se actualice en nuestro [repositorio de GHCR](https://github.com/users/biilal1999/packages/container/package/gamestore) el *Dockerfile* cuando se modifique. Así la imagen siempre estará actualizada.



![CodigoActions](https://github.com/biilal1999/GameStore/blob/master/docs/img/UsoDocker.png)




## Shippable


En nuestro [shippable.yml](https://github.com/biilal1999/GameStore/blob/master/shippable.yml) no usamos *Docker* para utilizar el **task runner**, sino que lo hacemos como está explicado [aquí](https://github.com/biilal1999/GameStore/blob/master/docs/UsoTaskRunner.md#shippable).



