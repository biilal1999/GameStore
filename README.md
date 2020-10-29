# GameStore

## Descripción general del proyecto

Nuestro microservicio consistirá en informar sobre las fechas de lanzamiento, descuentos y la posibilidad de reservar el videojuego.

Implementaremos el microservicio usando el lenguaje Ruby


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


## Rúbricas Docker


### Imágenes base

[Aquí](https://github.com/biilal1999/GameStore/blob/master/docs/ComparativaImagenes.md) pueden ver la comparativa de tamaños y velocidades (usando **build** y **time**) de las imágenes base **ruby:2.6.6-slim**, **ruby:2.7.2-alpine**, **ruby:2.7.2-buster** y **ruby:3.0.0-preview1-alpine**.


#### Elección de la imagen base

[Aquí](https://github.com/biilal1999/GameStore/blob/master/docs/ComparativaImagenes.md#decisi%C3%B3n-final-y-justificaci%C3%B3n-de-la-misma) pueden consultar la decisión final justificada de la elección de nuestra **imagen base**.


#### Optimización de la imagen base

[Aquí](https://github.com/biilal1999/GameStore/blob/master/docs/BuenasPracticasOptimizacion.md) puede consultar cómo hemos intentado optimizar nuestra imagen.


### Dockerfile

+ Fichero [Dockerfile](https://github.com/biilal1999/GameStore/blob/master/Dockerfile)

+ [Documentación y explicación](https://github.com/biilal1999/GameStore/blob/master/docs/ExplicacionDockerfile.md) de **Dockerfile**


### Docker Hub

+ Nuestro [repositorio](https://hub.docker.com/r/biilal1999/gamestore) en **Docker Hub**

+ [Documentación, pasos y pruebas](https://github.com/biilal1999/GameStore/blob/master/docs/DockerHub.md) de Docker Hub


### GitHub Container Registry

+ Nuestro [repositorio](https://github.com/users/biilal1999/packages/container/package/gamestore) en **GitHub Container Registry**

+ [Documentación, pasos y pruebas](https://github.com/biilal1999/GameStore/blob/master/docs/GitHubCR.md) de GitHub Container Registry


### Avance de código

Como avance de código hemos implementado métodos para [HU04](https://github.com/biilal1999/GameStore/issues/45) en [Tienda.rb](https://github.com/biilal1999/GameStore/tree/master/src/Tienda.rb) en concreto:

> indiceVideojuego(vid)

> masMuestras()

Además, hemos testeado en [tienda_espec_basicos.rb](https://github.com/biilal1999/GameStore/tree/master/spec/tests/tienda_spec_basicos.rb) métodos correspondientes a la historia de usuario.

Por último, hemos añadido **manejo de excepciones** en el *código fuente* y en loes *tests* tanto a estos métodos como a los anteriores, además de mejorar la organización del código.


## Fichero de gestor de tareas

+ Automatizador de tareas [Rakefile](https://github.com/biilal1999/GameStore/blob/master/Rakefile)

Además, pueden consultar la utilidad, comandos y pruebas de Rakefile [aquí](https://github.com/biilal1999/GameStore/blob/master/docs/GestorTareas.md)


## Pasos para la realización del proyecto

Estos son los [pasos](https://github.com/biilal1999/GameStore/blob/master/docs/PasosProyecto.md) llevados a cabo para la realización del proyecto. Dichos pasos se irán actualizando progresivamente conforme sigamos realizando las demás prácticas.


## Milestones

Los [*Milestones*](https://github.com/biilal1999/GameStore/milestones) con issues de nuestro proyecto:

- [Milestone 1](https://github.com/biilal1999/GameStore/milestone/1)
- [Milestone 2](https://github.com/biilal1999/GameStore/milestone/2)
- [Milestone 3](https://github.com/biilal1999/GameStore/milestone/3)


## Tareas

Los issues que hemos ido abriendo y cerrando durante la realización del proyecto los pueden consultar [aquí](https://github.com/biilal1999/GameStore/issues)


## Historias de usuario

Además, tambíen pueden ver los issues que son historias de usuario:

- [HU01](https://github.com/biilal1999/GameStore/issues/12)
- [HU02](https://github.com/biilal1999/GameStore/issues/13)
- [HU03](https://github.com/biilal1999/GameStore/issues/14)
- [HU04](https://github.com/biilal1999/GameStore/issues/45)


## Curso de desarrollo

Asignatura [Infraestructura virtual](https://github.com/JJ/IV-20-21) de 4º curso del grado de Ingeniería Informática en la especialidad de Tecnologías de la Información.


## Autor

[Mohamed Bilal Chekfeh Al Sabbagh](https://github.com/biilal1999)
