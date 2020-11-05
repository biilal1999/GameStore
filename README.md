# GameStore

## Descripción general del proyecto

Nuestro microservicio consistirá en informar sobre las fechas de lanzamiento, descuentos y la posibilidad de reservar el videojuego.

Implementaremos el microservicio usando el lenguaje Ruby.


## Utilidad del proyecto

Son muchas las ocasiones en las que hemos querido comprar algún videojuego y lo encontramos a un precio no deseado o, directamente, agotado. Esto suele suceder debido a que cuando dichos productos están en oferta, *se venden como pan caliente*.


## Ubicaciones

+ Nuestra carpeta de [documentos](https://github.com/biilal1999/GameStore/tree/master/docs)
    + Nuestra carpeta de [imágenes](https://github.com/biilal1999/GameStore/tree/master/docs/img)
+ Nuestra carpeta de [código fuente](https://github.com/biilal1999/GameStore/tree/master/src)
+ Nuestra carpeta [spec](https://github.com/biilal1999/GameStore/tree/master/spec)
    + Nuestra carpeta de [tests](https://github.com/biilal1999/GameStore/tree/master/spec/tests)


## Fichero iv.yaml

[iv.yaml](https://github.com/biilal1999/GameStore/blob/master/iv.yaml)


## Rúbricas Integración Continua


## Sistemas de integración continua

Hemos usado tres sistemas de **integración continua** en lugar de dos, ya que veía la posibilidad de realizar acciones diferentes en cada una de ellas.


### Travis CI

+ Fichero [.travis.yml](https://github.com/biilal1999/GameStore/blob/master/.travis.yml)

+ [Documentación, utilidad, pasos y pruebas](https://github.com/biilal1999/GameStore/blob/master/docs/ExplicacionTravis.md) en la construcción de **.travis.yml**

+ Nuestro [perfil](https://travis-ci.com/github/biilal1999/GameStore) de Travis para el repositorio.


### GitHub Actions

+ Fichero [githubActions.yml](https://github.com/biilal1999/GameStore/blob/master/.github/workflows/githubActions.yml)

+ [Documentación, utilidad, pasos y pruebas](https://github.com/biilal1999/GameStore/blob/master/docs/ExplicacionGitHubActions.md) en la construcción de **.github/workflows/gitHubActions.yml**

+ Nuestros [Actions](https://github.com/biilal1999/GameStore/actions) para el repositorio.


### Shippable

+ Fichero [shippable.yml](https://github.com/biilal1999/GameStore/blob/master/shippable.yml)

+ [Documentación, utilidad, pasos y pruebas](https://github.com/biilal1999/GameStore/blob/master/docs/ExplicacionShippable.md) en la construcción de **shippable.yml**

+ Nuestro [perfil](https://app.shippable.com/github/biilal1999/GameStore/dashboard) de Shippable para el repositorio.


## Uso del Task Runner

+ [Explicación](https://github.com/biilal1999/GameStore/blob/master/docs/UsoTaskRunner.md) del uso del **task runner** en cada uno de los sistemas de integración continua anteriores


## Uso del contenedor de Docker

+ [Explicación](https://github.com/biilal1999/GameStore/blob/master/docs/UsoDocker.md) del uso de **Docker** en alguno de los sistemas de integración continua anteriores


## Tests significativos y avance del código

+ Hemos añadido una [historia de usuario](https://github.com/biilal1999/GameStore/issues/64)

+ Hemos creado la clase [Cliente.rb](https://github.com/biilal1999/GameStore/blob/master/src/Cliente.rb) e implementado todos sus métodos

    + Hemos testeado los métodos de la clase en [cliente_spec_basicos.rb](https://github.com/biilal1999/GameStore/blob/master/spec/tests/cliente_spec_basicos.rb) y en [cliente_spec_significativos.rb](https://github.com/biilal1999/GameStore/blob/master/spec/tests/cliente_spec_significativos.rb)

+ Hemos añadido los siguientes métodos a la clase [Tienda.rb](https://github.com/biilal1999/GameStore/blob/master/src/Tienda.rb) y los hemos testeado en [tienda_spec_tests.rb](https://github.com/biilal1999/GameStore/blob/master/spec/tests/tienda_spec_tests.rb)

> obtenerSigCodigo()

> identificarVideojuego(nombreVideojuego)

> venderProducto (cli, vj)

> addVideojuego(videojuego) 



## Docker


### Dockerfile

+ Fichero [Dockerfile](https://github.com/biilal1999/GameStore/blob/master/Dockerfile)


### Docker Hub

+ Nuestro [repositorio](https://hub.docker.com/r/biilal1999/gamestore) en **Docker Hub**

### GitHub Container Registry

+ Nuestro [repositorio](https://github.com/users/biilal1999/packages/container/package/gamestore) en **GitHub Container Registry**



## Fichero de gestor de tareas

+ Automatizador de tareas [Rakefile](https://github.com/biilal1999/GameStore/blob/master/Rakefile)


## Pasos para la realización del proyecto

Estos son los [pasos](https://github.com/biilal1999/GameStore/blob/master/docs/PasosProyecto.md) llevados a cabo para la realización del proyecto. Dichos pasos se irán actualizando progresivamente conforme sigamos realizando las demás prácticas.


## Milestones

Los [*Milestones*](https://github.com/biilal1999/GameStore/milestones) con issues de nuestro proyecto:

- [Milestone 1](https://github.com/biilal1999/GameStore/milestone/1)
- [Milestone 2](https://github.com/biilal1999/GameStore/milestone/2)
- [Milestone 3](https://github.com/biilal1999/GameStore/milestone/3)
- [Milestone 4](https://github.com/biilal1999/GameStore/milestone/4)


## Tareas

Los issues que hemos ido abriendo y cerrando durante la realización del proyecto los pueden consultar [aquí](https://github.com/biilal1999/GameStore/issues)


## Historias de usuario

Además, tambíen pueden ver los issues que son historias de usuario:

- [HU01](https://github.com/biilal1999/GameStore/issues/12)
- [HU02](https://github.com/biilal1999/GameStore/issues/13)
- [HU03](https://github.com/biilal1999/GameStore/issues/14)
- [HU04](https://github.com/biilal1999/GameStore/issues/45)
- [HU05](https://github.com/biilal1999/GameStore/issues/64)


## Curso de desarrollo

Asignatura [Infraestructura virtual](https://github.com/JJ/IV-20-21) de 4º curso del grado de Ingeniería Informática en la especialidad de Tecnologías de la Información.


## Autor

[Mohamed Bilal Chekfeh Al Sabbagh](https://github.com/biilal1999)
