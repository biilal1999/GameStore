# GitHub Container Registry


## Documentación

[Aquí](https://docs.github.com/es/free-pro-team@latest/packages/using-github-packages-with-your-projects-ecosystem/configuring-docker-for-use-with-github-packages) podemos consultar la documentación que me ha ayudado para subir nuestro contenedor a *GitHub Container Registry*, además de información útil sobre *tokens*.


## Pasos para la subida al sistema de contenedores

Utilizando las **buenas prácticas** para hacerlo, seguimos los siguientes pasos:

Una vez hacemos **git push** a nuestro repositorio, se ejecuta el fichero [**GitHub Actions**](https://github.com/biilal1999/GameStore/blob/master/.github/workflows/github-docker-actions.yml) y, se sube a *DockerHub Cointainer Registry* nuestro paquete, tal y como se puede ver [aquí](https://github.com/users/biilal1999/packages/container/package/gamestore).

Una vez hecho eso, enlazamos el paquete con nuestro repositorio de GitHub [GameStore](https://github.com/biilal1999/GameStore).

Además, en *package settings*, establecemos como público el paquete para permitir su posterior descarga.


## Pruebas

En esta imagen podemos ver:

1. El paquete montado

2. El comando para descargarlo, el cual es `docker pull ghcr.io/biilal1999/gamestore:latest`

3. El repositorio fuente de GitHub

4. El [README.md](https://github.com/biilal1999/GameStore/blob/master/README.md) sincronizado con el del repositorio fuente



![GitHubCR](https://github.com/biilal1999/GameStore/blob/master/docs/img/GitHubContainerRegistry.png)
