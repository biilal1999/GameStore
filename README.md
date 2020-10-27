# GameStore

## Descripción general del proyecto

Nuestro microservicio consistirá en informar sobre las fechas de lanzamiento, descuentos y la posibilidad de reservar el videojuego.

Implementaremos el microservicio usando el lenguaje Ruby


## Utilidad del proyecto

Son muchas las ocasiones en las que hemos querido comprar algún videojuego y lo encontramos a un precio no deseado o, directamente, agotado. Esto suele suceder debido a que cuando dichos productos están en oferta, *se venden como pan caliente*.


## Ubicaciones

+ Nuestra carpeta de [documentos](https://github.com/BilalKxK99/GameStore/tree/master/docs)
    + Nuestra carpeta de [imágenes](https://github.com/BilalKxK99/GameStore/tree/master/docs/img)
+ Nuestra carpeta de [código fuente](https://github.com/BilalKxK99/GameStore/tree/master/src)
+ Nuestra carpeta [spec](https://github.com/BilalKxK99/GameStore/tree/master/spec)
    + Nuestra carpeta de [tests](https://github.com/BilalKxK99/GameStore/tree/master/spec/tests)


## Fichero iv.yaml

[iv.yaml](https://github.com/BilalKxK99/GameStore/blob/master/iv.yaml)


## Rúbricas Docker


### Imágenes base

[Aquí](https://github.com/biilal1999/GameStore/blob/master/docs/ComparativaImagenes.md) pueden ver la comparativa de tamaños y velocidades (usando **build** y **time**) de las imágenes base **ruby:2.6.6-slim** y **ruby:2.7.2-alpine**.


#### Elección de la imagen base

En cuanto a la elección de la imagen base para nuestro contenedor, hemos decidido utilizar **ruby:2.7.2-alpine** , pues como se puede apreciar en la comparativa linkeada anteriormente, tarda 4 décimas menos de segundo en ejecutar y, además, ocupa prácticamente 100 MB menos que la versíón de *slim*. Además, **ruby:2.7.2-alpine**, que deriva de una versión de Alpine Linux, es versión oficial y se utiliza bastante en equipos de desarrollo con *Ruby on Rails*.


### Dockerfile

+ Fichero [Dockerfile](https://github.com/biilal1999/GameStore/blob/master/Dockerfile)

+ [Documentación y explicación](https://github.com/biilal1999/GameStore/blob/master/docs/ExplicacionDockerfile.md) de **Dockerfile**


### Docker Hub

+ Nuestro [repositorio](https://hub.docker.com/r/biilal1999/gamestore) en **Docker Hub**

+ [Documentación, pasos y pruebas](https://github.com/biilal1999/GameStore/blob/master/docs/DockerHub.md) de Docker Hub


## Justificación de la herramienta de construcción RAKE

[Aquí](https://github.com/BilalKxK99/GameStore/blob/master/docs/JustifiacionHerramientaConstruccion.md) pueden consultar la justificación de la configuración de la herramienta de construcción Rake.


## Dependencias

+ Fichero de dependencias [Gemfile](https://github.com/BilalKxK99/GameStore/blob/master/Gemfile)
+ Fichero de control de versiones [Gemfile.lock](https://github.com/BilalKxK99/GameStore/blob/master/Gemfile.lock)


### Gestor de dependencias

**Bundler** es nuestro gestor de dependencias. Puede consultar [aquí](https://github.com/BilalKxK99/GameStore/blob/master/docs/Dependencias.md) la justificación de su uso y su documentación, además de las explicaciones de **spec/**, **Gemfile** y **Gemfile.lock**.


## Fichero de gestor de tareas

+ Automatizador de tareas [Rakefile](https://github.com/BilalKxK99/GameStore/blob/master/Rakefile)

Además, pueden consultar la utilidad, comandos y pruebas de Rakefile [aquí](https://github.com/BilalKxK99/GameStore/blob/master/docs/GestorTareas.md)


## Herramientas para el desarrollo

[Aquí](https://github.com/BilalKxK99/GameStore/blob/master/docs/herramientas.md) podrán consultar la razón por la que utilizamos el lenguaje *Ruby*, además de otras herramientas como el gestor de versiones o el sistema de log.


## Marco de test y biblioteca de aserciones

Hemos usado **RSpec** como marco para tests y como biblioteca para aserciones (ya incluida). Puede ver [aquí](https://github.com/BilalKxK99/GameStore/blob/master/docs/ProgramaTesting.md) la explicación.


## Pasos para la realización del proyecto

Estos son los [pasos](https://github.com/BilalKxK99/GameStore/blob/master/docs/PasosProyecto.md) llevados a cabo para la realización del proyecto. Dichos pasos se irán actualizando progresivamente conforme sigamos realizando las demás prácticas.


## Milestones

Los [*Milestones*](https://github.com/BilalKxK99/GameStore/milestones) con issues de nuestro proyecto:

- [Milestone 1](https://github.com/BilalKxK99/GameStore/milestone/1)
- [Milestone 2](https://github.com/BilalKxK99/GameStore/milestone/2)
- [Milestone 3](https://github.com/BilalKxK99/GameStore/milestone/3)


## Tareas

Los issues que hemos ido abriendo y cerrando durante la realización del proyecto los pueden consultar [aquí](https://github.com/BilalKxK99/GameStore/issues)


## Historias de usuario

Además, tambíen pueden ver los issues que son historias de usuario:

- [HU01](https://github.com/BilalKxK99/GameStore/issues/12)
- [HU02](https://github.com/BilalKxK99/GameStore/issues/13)
- [HU03](https://github.com/BilalKxK99/GameStore/issues/14)
- [HU04](https://github.com/BilalKxK99/GameStore/issues/45)

## Curso de desarrollo

Asignatura [Infraestructura virtual](https://github.com/JJ/IV-20-21) de 4º curso del grado de Ingeniería Informática en la especialidad de Tecnologías de la Información.


## Autor

[Mohamed Bilal Chekfeh Al Sabbagh](https://github.com/BilalKxK99)
