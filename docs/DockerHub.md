# Uso de Docker Hub

## Documentación

La documentación que me ha ayudado a configurar mi repositorio en Docker Hub para que se actualice por cada *push* en el de GitHub está [aquí](https://docs.docker.com/docker-hub/builds/) .


## Pasos a seguir

1. Una vez creado nuestro perfil en *Docker Hub* y nuestro repositorio **gamestore**, hacemos link entre ambos repositorios respectivamente. 

2. Acto seguido, nos disponemos a configurar las *herramientas de construcción automática*, de tal forma que por cada *push* que hagamos en nuestro repositorio de *GitHub*, se hará un *build* en *Docker Hub* para actualizar la información correspondiente.


## Pasos para probar nuestro contenedor

1. Primero, nos bajaremos el repositorio con el comando `docker pull biilal1999/gamestore` .

2. Luego, desde la carpeta local clonada del repositorio, testearemos el contenedor con la orden que nos proporciona el profesor, [aquí](https://github.com/biilal1999/GameStore/blob/master/docs/img/DockerHubPrueba.png) pueden ver una muestra de la ejecución.


## Pruebas de la configuración de Docker Hub


### Linkeamos nuestra cuenta de GitHub con la de Docker Hub

+ A la derecha podemos ver como nuestro repositorio de GitHub es el repositorio **FUENTE** del que tenemos en Docker Hub


![LinksAccounts](https://github.com/biilal1999/GameStore/blob/master/docs/img/LinkAccounts.png)



### Prueba de las construcciones realizadas en Docker Hub a raíz de GitHub


![DockerHubBuilds](https://github.com/biilal1999/GameStore/blob/master/docs/img/DockerHubBuilds.png)



### Captura de nuestro apartado de Webhooks en Git Hub

![Webhook](https://github.com/biilal1999/GameStore/blob/master/docs/img/Webhook.png)



### Prueba de descarga y testeo del contenedor en la terminal


![CapturaTerminal](https://github.com/biilal1999/GameStore/blob/master/docs/img/DockerHubPrueba.png)
