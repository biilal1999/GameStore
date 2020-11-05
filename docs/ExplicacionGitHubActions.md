# JUSTIFICACIÓN GITHUB ACTIONS


## Documentación

Para construir nuestro fichero [gitHubActions.yml](https://github.com/biilal1999/GameStore/blob/master/.github/workflows/githubActions.yml) hemos consultado la siguiente [documentación](https://www.docker.com/blog/docker-support-for-the-new-github-container-registry/).

La sintaxis para construir el fichero la podemos encontrar [aquí](https://docs.github.com/es/free-pro-team@latest/actions/reference/workflow-syntax-for-github-actions).


## Utilidad

Este sistema de integración continua, propio de **GitHub**, se ejecuta cada vez que hagamos **push** a nuestro repositorio [GameStore](https://github.com/biilal1999/GameStore). **GitHub Actions** te crea una máquina virtual con la versión de Linux que le especifiques en el *fichero actions*, y ahí ejecuta los pasos que indiquemos.

Una ventaja tremenda de *GitHub Actions* es su velocidad a la hora de *construir* los pasos indicados en el *fichero actions*. Sin duda es bastante más veloz que *Travis CI* y, más aún que *Shippable*. Además, hay que tener en cuenta que los distintos *trabajos* de un fichero *GitHub Actions* se ejecutan en paralelo.

Pero...


### ¿Qué nos aporta en especial GitHub Actions en este hito?

Al usar varios sistemas de integración continua (Travis, Shippable, GitHub Actions) es buena práctica aprovechar y hacer *algo distinto* en cada una de ellas. 

Dado que **GitHub Actions** nos ofrece la posibilidad de iniciar sesión en nuestro **GitHub Container Registry**, cada vez que hagamos **push** a nuestro proyecto, también se hará push de nuestro contenedor a [nuestro repositorio en GitHub Container Registry](https://github.com/users/biilal1999/packages/container/package/gamestore), para asegurarnos siempre de mantener actualizado nuestro [Dockerfile](https://github.com/biilal1999/GameStore/blob/master/Dockerfile). Es decir, si modificamos el Dockerfile y luego hacemos **pull** a la última imagen que tenemos en GitHub Container Registry nos encontraríamos con una imagen desactualizada. Por eso es importante que, por cada *push*, actualicemos nuestro **repositorio em GitHub Container Registry**.



## Construcción de .github/worklows/gitHubActions.yml


1. Definimos el nombre del *actions*, usando la directiva **name**

2. Definimos **push** como nuestro evento, utilizando la directiva **on**, ya que se ejecutará este fichero de construcción por cada *push*.

3. Empezamos a declarar ya nuestra *secuencia de trabajos*, utilizando la directiva **jobs**

4. El trabajo que vamos a ejecutar tendrá el identificador **build**.

5. Dicho trabajo se ejecutará en una máquina virtual creada con la última versión de Ubuntu, especificado así con la directiva **runs-on**.

6. Empezamos a definir los pasos(**steps**) para nuestro trabajo, teniendo en cuenta que un paso no se ejecutará si el anterior no fue exitoso:

    + Hacemos un *check out* de nuestro repositorio.
    
    + Iniciamos sesión en **GitHub Container Registry**. Para hacer esto, especificamos con **registry** que queremos iniciar sesión ahí. Como cualquier sistema de autenticación, necesitaremos usuario y contraseña. Como usuario, **${{ github.repository_owner }}** nos dice nuestro nick de usuario, y para la contraseña hemos creado dentro de nuestra cuenta de *GitHub*, un **secret** que almacena un **token**. [Aquí](https://github.com/biilal1999/GameStore/blob/master/docs/img/Token.png) pueden ver que tenemos el *token* creado y [aquí](https://github.com/biilal1999/GameStore/blob/master/docs/img/Secrets.png) como también hemos creado el *secret*, el cual hemos llamado **TOK**. Para usar el *secret TOK* en *GitHub Actions*, utilizamos **${{ secrets.TOK }}**.

    + Construimos nuestra imagen con la directiva **run** (utiliza la *shell* del Sistema Operativo donde se esté ejecutando), utilizando el comando `docker build -t ghcr.io/biilal1999/gamestore:latest .`.

    + Hacemos correr la imagen también con la directiva **run**, aprovechando la shell, utilizando el ya conocido

> docker run -t -v `pwd`:/test ghcr.io/biilal1999/gamestore:latest

    + Por último, una vez todo haya ido bien, hacemos **push** de la imagen a nuestro [repositorio de GHCR](https://github.com/users/biilal1999/packages/container/package/gamestore), también usando **run**, utilizando el comando `docker push ghcr.io/biilal1999/gamestore:latest`.



## Pruebas del funcionamiento de nuestro GitHub Actions


**GitHub Actions** corriendo después de un *push* a nuestro repositorio


![Corriendo](https://github.com/biilal1999/GameStore/blob/master/docs/img/GitHubActionsCorriendo.png)



**Build** con éxito de nuestro *GitHub Actions*, donde hemos desplegado algunos pasos como el **login** o la ejecución de **tests** para que se pueda observar bien su funcionamiento


![Funcionamiento](https://github.com/biilal1999/GameStore/blob/master/docs/img/GitHubActionsFuncionando.png)




## Ejemplo de un run concreto de nuestro GitHub Actions


[Aquí](https://github.com/biilal1999/GameStore/runs/1355714543?check_suite_focus=true) lo pueden consultar.
