# GitHub Actions UTILIZANDO BUENAS PRÁCTICAS

## Documentación

[Aquí](https://www.docker.com/blog/docker-support-for-the-new-github-container-registry/) podemos consultar la documentación que me ha ayudado para construir el fichero [**github-docker-actions.yml**](https://github.com/biilal1999/GameStore/blob/master/.github/workflows/github-docker-actions.yml) . 

Además, como para crear dicho fichero necesitaremos ejecutar comandos dentro de él, nos ayudaremos en la documentación adjunta [aquí](https://docs.github.com/es/free-pro-team@latest/packages/using-github-packages-with-your-projects-ecosystem/configuring-docker-for-use-with-github-packages), que además, nos informa sobre el uso de los *tokens*.


## Pasos del fichero

Utilizando la sintaxis de *yml* y las **buenas prácticas** para hacerlo, se construye un fichero con los siguientes pasos:

+ Primero, en la estructura **with** establecemos que nos queremos conectar a un servidor externo.

    + Usando **registry** indicando *dhcr.io*
    + Usando **username** indicando con *github.repository_owner* nuestro nick de GitHub
    + Usando **password** indicando con *secrets.TOK* el **TOKEN** generado en nuestra cuenta de GitHub.

+ Segundo, construimos la imagen utilizando `docker build -t ghcr.io/biilal1999/gamestore:latest .`

+ Tercero, subimos la imagen a nuestro *GitHub Container Registry* utilizando el comando `docker push ghcr.io/biilal1999/gamestore:latest`

+ Por último, ejecutamos también los tests con el comando que nos proporciona el profesor [aquí](http://jj.github.io/IV/documentos/proyecto/3.Docker#entrega-de-la-pr%C3%A1ctica)


## Pruebas


### Token generado

Token con permisos de lectura y escritura en repositorios


![Token](https://github.com/biilal1999/GameStore/blob/master/docs/img/Token.png)



### Secret generado

Token almacenado en secret **TOK**


![Secrets](https://github.com/biilal1999/GameStore/blob/master/docs/img/Secrets.png)


### GitHub Actions funcionando


![PruebaActions](https://github.com/biilal1999/GameStore/blob/master/docs/img/GitHubActions.png)


