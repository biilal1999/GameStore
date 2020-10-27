# GitHub Container Registry


## Documentación

[Aquí](https://docs.github.com/es/free-pro-team@latest/packages/using-github-packages-with-your-projects-ecosystem/configuring-docker-for-use-with-github-packages) podemos consultar la documentación que me ha ayudado para subir nuestro contenedor a *GitHub Container Registry*, además de información útil sobre *tokens*.


## Pasos para la subida al sistema de contenedores

Utilizando las **buenas prácticas** para hacerlo, seguimos los siguientes pasos:

1. Generamos un **token** para nuestra cuenta de GitHub y lo almacenamos en un archivo *TOKEN.txt* localmente en nuestro PC.

2. Hacemos **login** en *GitHub Container Registry* ayudándonos del *token* que creamos, con el comando `cat ~/TOKEN.txt | docker login https://docker.pkg.github.com -u biilal1999 --password-stdin` 

3. Construimos una **imagen** para nuestro contenedor ejecutando el comando `docker build -t ghcr.io/biilal1999/gamestore:latest .`

4. Subimos la imagen a nuestro *GitHub Container Registry* utilizando el comando `docker push ghcr.io/biilal1999/gamestore:latest`

    + Una vez finalizado todo esto, podemos ver ya nuestro paquete [aquí](https://github.com/users/biilal1999/packages/container/package/gamestore).

5. Enlazamos el paquete con nuestro repositorio de GitHub [**GameStore**](https://github.com/biilal1999/GameStore).

6. Por último, en **package settings** establecemos como público el paquete para permitir su posterior descarga.



## Pruebas


### Token generado

Token con permisos de lectura y escritura en repositorios


![Token](https://github.com/biilal1999/GameStore/blob/master/docs/img/Token.png)




### Paquete subido

En esta imagen podemos ver:

1. El paquete montado

2. El comando para descargarlo, el cual es `docker pull ghcr.io/biilal1999/gamestore:latest`

3. El repositorio fuente de GitHub

4. El [README.md](https://github.com/biilal1999/GameStore/blob/master/README.md) sincronizado con el del repositorio fuente



![GitHubCR](https://github.com/biilal1999/GameStore/blob/master/docs/img/GitHubContainerRegistry.png)
