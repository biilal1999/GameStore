# JUSTIFICACIÓN DE TRAVIS


## Documentación

Para usar **Travis** como sistema de integración continua, hemos consultado varias webs para tener los conceptos claros a la hora de entender las **buenas prácticas** con *Travis*.

+ [Aquí](https://www.genbeta.com/desarrollo/travis-ci-sistema-distribuido-de-integracion-continua-libre-integrado-con-github#:~:text=Travis%20CI%20te%20permite%20conectar,que%20hagas%2C%20regenerando%20el%20proyecto.&text=Una%20de%20las%20ventajas%20m%C3%A1s,por%20ejemplo)%20o%20data%20stores.) tienen la documentación que nos ayuda a entender el motivo por el que utilizar Travis.

+ [Aquí](https://docs.travis-ci.com/user/job-lifecycle/) tienen la documentación que nos explica el ciclo de vida común en la contrucción de Travis.

+ [Aquí](https://docs.travis-ci.com/user/languages/minimal-and-generic/#minimal) tienen la documentación nos explica el lenguaje **minimal** que luego explicaremos el porqué lo usamos en nuestro fichero de configuración.


## Utilidad

**Travis CI**, como sistema de integración continua, permite conectarte de forma muy sencilla con tu repositorio de *GitHub* y actualizarlo por cada *push* al mismo. También Travis soporta múltiples versiones de múltiples lennguajes como *Node*, *Ruby*, *Python*, etc., además de la construcción de máquinas virtuales donde puedes hacer correr diversos servicios como *MySQL* o *Docker*.

Además, hay que tener en cuenta que **Travis CI** es capaz de ejecutar en paralelo varias construcciones dentro de un mismo *job* (esto es, por ejemplo, cuando definimos un lenguaje con más de una versión), lo cual agiliza bastante el proceso. Esta es una ventaja con la que, por ejemplo, **Shippable** no cuenta.
