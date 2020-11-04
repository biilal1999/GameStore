# JUSTIFICACIÓN DE TRAVIS


## Documentación

Para usar **Travis** como sistema de integración continua, hemos consultado varias webs para tener los conceptos claros a la hora de entender las **buenas prácticas** con *Travis*.

+ [Aquí](https://www.genbeta.com/desarrollo/travis-ci-sistema-distribuido-de-integracion-continua-libre-integrado-con-github#:~:text=Travis%20CI%20te%20permite%20conectar,que%20hagas%2C%20regenerando%20el%20proyecto.&text=Una%20de%20las%20ventajas%20m%C3%A1s,por%20ejemplo) tienen la documentación que nos ayuda a entender el motivo por el que utilizar Travis.

+ [Aquí](https://docs.travis-ci.com/user/job-lifecycle/) tienen la documentación que nos explica el ciclo de vida común en la contrucción de Travis.

+ [Aquí](https://docs.travis-ci.com/user/languages/minimal-and-generic/#minimal) tienen la documentación nos explica el lenguaje **minimal** que luego explicaremos el porqué lo usamos en nuestro fichero de configuración.


## Utilidad

**Travis CI**, como sistema de integración continua, permite conectarte de forma muy sencilla con tu repositorio de *GitHub* y actualizarlo por cada *push* al mismo. También Travis soporta múltiples versiones de múltiples lennguajes como *Node*, *Ruby*, *Python*, etc., además de la construcción de máquinas virtuales donde puedes hacer correr diversos servicios como *MySQL* o *Docker*.

Además, hay que tener en cuenta que **Travis CI** es capaz de ejecutar en paralelo varias construcciones dentro de un mismo *job* (esto es, por ejemplo, cuando definimos un lenguaje con más de una versión), lo cual agiliza bastante el proceso. Esta es una ventaja con la que, por ejemplo, **Shippable** no cuenta.


## Construcción de .travis.yml

Antes de detallar los pasos de la construcción del fichero [.travis.yml](https://github.com/biilal1999/GameStore/blob/master/.travis.yml) , hay que tener en cuenta que vamos a aprovechar nuestro contenedor *Docker* creado en el hito anterior.


1. Primero, especificamos el lenguaje que vamos a usar en nuestro *.travis.yml* . Dado que es *Ruby* el lenguaje que estamos utilizando en nuestro proyecto, lo normal sería declarar Ruby como lenguaje en nuestro fichero de construcción. Sin embargo, como hemos explicado anteriormente, vamos a usar *Docker*, y recordemos que en nuestro [Dockerfile](https://github.com/biilal1999/GameStore/blob/master/Dockerfile) ya especificamos la imagen que vamos a utilizar (en nuestro caso era **ruby:2.7.2-alpine**). Con lo cual, se nos abren dos posibilidades:

    + Opción A. Utilizar **minimal** como lenguaje en nuestro fichero de construcción.
    + Opción B. Utilizar **generic** en lugar de minimal.

    Vamos a optar por la opción A, usaremos `language: minimal`. La razón es muy sencilla, y es que **minimal** ya nos trae lo necesario para trabajar con lo que necesitamos trabajar ahora, que es **Docker**. Pero además, también trae herramientas para control de versiones, para red, Python, gcc y make. *Generic* sin embargo, trae más herramientas como node.js o jvm que lo único que van a conseguir para lo que necesitamos es que se tarde más tiempo en ejecutar Travis.


2. Después, siguiendo las buenas prácticas en la construcción del ciclo de vida para *Travis*, declaramos `before_script: docker build -t gametrav .` . Esto  
