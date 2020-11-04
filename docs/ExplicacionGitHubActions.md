# JUSTIFICACIÓN GITHUB ACTIONS


## Documentación

Para construir nuestro fichero [gitHubActions.yml](https://github.com/biilal1999/GameStore/blob/master/.github/workflows/githubActions.yml) hemos consultado la siguiente [documentación](https://www.docker.com/blog/docker-support-for-the-new-github-container-registry/).

La sintaxis para construir el fichero la podemos encontrar [aquí](https://docs.github.com/es/free-pro-team@latest/actions/reference/workflow-syntax-for-github-actions).


## Utilidad

Este sistema de integración continua, propio de **GitHub**, se ejecuta cada vez que hagamos **push** a nuestro repositorio [GameStore](https://github.com/biilal1999/GameStore). **GitHub Actions** te crea una máquina virtual con la versión de Linux que le especifiques en el *fichero actions*, y ahí ejecuta los pasos que indiquemos.

Una ventaja tremenda de *GitHub Actions* es su velocidad a la hora de *construir* los pasos indicados en el *fichero actions*. Sin duda es bastante más veloz que *Travis CI* y, más aún que *Shippable*.

Pero...


### ¿Qué nos aporta en especial GitHub Actions en este hito?

Al usar varios sistemas de integración continua (Travis, Shippable, GitHub Actions) es buena práctica aprovechar y hacer *algo distinto* en cada una de ellas. 

Dado que **GitHub Actions** nos ofrece la posibilidad de iniciar sesión en nuestro **GitHub Container Registry**, cada vez que hagamos **push** a nuestro proyecto, también se hará push de nuestro contenedor a [nuestro repositorio en GitHub Container Registry](https://github.com/users/biilal1999/packages/container/package/gamestore), para asegurarnos siempre de mantener actualizado nuestro [Dockerfile](https://github.com/biilal1999/GameStore/blob/master/Dockerfile). Es decir, si modificamos el Dockerfile y luego hacemos **pull** a la última imagen que tenemos en GitHub Container Registry nos encontraríamos con una imagen desactualizada. Por eso es importante que, por cada *push*, actualicemos nuestro **repositorio em GitHub Container Registry**.



## Construcción de .github/worklows/gitHubActions.yml



