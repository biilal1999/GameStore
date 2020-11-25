# Pasos para la realización del proyecto GameStore

## Hito 0: Git y GitHub para entrega de hitos del proyecto

- Realizar Fork del repositorio de la [asignatura](https://github.com/JJ/IV-20-21)
- Actualizar fichero de [objetivos](https://github.com/BilalKxK99/IV-20-21/blob/master/objetivos/BilalKxK99.md)
- Crear repositorio para nuestro [proyecto](https://github.com/BilalKxK99/GameStore)
    - Modificar archivo de configuración
    - Añadir archivo .gitignore
    - Añadir clave pública y privada SSH
    - Modificar archivo [README.md](https://github.com/BilalKxK99/GameStore/blob/master/README.md) para añadir la descripción general del proyecto 
- Modificar [hito-0.md](https://github.com/JJ/IV-20-21/blob/master/proyectos/hito-0.md) y hacer *Pull Request* con enlace a nuestro proyecto


## Hito 1: Estructura general del proyecto

- Crear el archivo [herramientas.md](https://github.com/BilalKxK99/GameStore/blob/master/docs/herramientas.md) para describir las herramientas a utilizar en el proyecto
- Crear los *Milestones* de hito 1, hito 2 e hito 3.
- Crear, y cerrar, los [issues](https://github.com/BilalKxK99/GameStore/issues) del hito 1
    - Crear, y cerrar, las historias de usuario 
- Añadir fichero [iv.yaml](https://github.com/BilalKxK99/GameStore/blob/master/iv.yaml)
- Crear carpeta **src/**
    - Crear fichero .rb con código correspondiente a la estructura de la clase
- Volver a modificar el archivo [README.md](https://github.com/BilalKxK99/GameStore/blob/master/README.md) para añadir los links restantes
- Modificar [hito-1.md](https://github.com/JJ/IV-20-21/blob/master/proyectos/hito-1.md) y hacer *Pull Request* con enlace a nuestro proyecto


## Hito 2: Tests

- Añadir la carpeta [**spec/**](https://github.com/BilalKxK99/GameStore/tree/master/spec) y, dentro, la carpeta [**tests/**](https://github.com/BilalKxK99/GameStore/tree/master/spec/tests)
    - Añadir dentro de la carpeta **tests/** los ficheros .rb con los tests, tanto unitarios como significativos, para probar los métodos de nuestra clase
- Añadir a la carpeta [**src/**](https://github.com/BilalKxK99/GameStore/tree/master/src) más ficheros .rb con nuestras clases para el proyecto
    - Implementar los métodos correspondientes a las historias de usuario en las clases ubicadas en la carpeta **src/** , además de otros métodos auxiliares para nuestras clases
- Añadir los ficheros ficheros [Gemfile](https://github.com/BilalKxK99/GameStore/blob/master/Gemfile) y [Gemfile.lock](https://github.com/BilalKxK99/GameStore/blob/master/Gemfile.lock) para manejar nuestras dependencias en Ruby
- Crear fichero [Rakefile](https://github.com/BilalKxK99/GameStore/blob/master/Rakefile) para automatizar la ejecución de tareas (tests y dependencias) de nuestro proyecto en *Ruby On Rails*
- Modificar fichero [iv.yaml](https://github.com/BilalKxK99/GameStore/blob/master/iv.yaml) con nuevas claves (lenguaje, test y taskfile)
- Actualizar el archivo [herramientas.md](https://github.com/BilalKxK99/GameStore/blob/master/docs/herramientas.md) para explicar herramientas como RVM, RSpec, Bundler o Rakefile
- Añadir capturas de pantalla de prueba de ejecución de Rakefile en la carpeta [**img/**](https://github.com/BilalKxK99/GameStore/tree/master/docs/img)
- Modifichar el archivo [README.md](https://github.com/BilalKxK99/GameStore/blob/master/README.md) para añadir los links correspondientes a este hito
- Modificar [hito-2.md](https://github.com/JJ/IV-20-21/blob/master/proyectos/hito-2.md) y hacer *Pull Request* con enlace a nuestro proyecto


## Hito 3: Creación de un contenedor para pruebas

- Construir fichero [Dockerfile](https://github.com/biilal1999/GameStore/blob/master/Dockerfile)
- Crear [repositorio](https://hub.docker.com/r/biilal1999/gamestore) en **Docker Hub** enlazado con el de *GitHub*
- Crear [paquete](https://github.com/users/biilal1999/packages/container/package/gamestore) en **GitHub Container Registry** enlazado con el de GitHub
- Añadir a la carpeta [**docs/**](https://github.com/biilal1999/GameStore/blob/master/docs)
    - [Archivo](https://github.com/biilal1999/GameStore/blob/master/docs/ComparativaImagenes.md) comparando imágenes base para nuestro contenedor
    - [Archivo](https://github.com/biilal1999/GameStore/blob/master/docs/ExplicacionDockerfile.md) explicando cómo hemos construido **Dockerfile**
    - [Archivo](https://github.com/biilal1999/GameStore/blob/master/docs/DockerHub.md) explicando cómo hemos usado *Docker Hub*
    - [Archivo](https://github.com/biilal1999/GameStore/blob/master/docs/GitHubCR.md) explicando cómo hemos usado *GitHub Container Registry*
- Añadir capturas de pantalla de ejecución utilizando **docker run** en la carpeta [**img/**](https://github.com/biilal1999/GameStore/tree/master/docs/img)
- Redactar en el archivo [README.md](https://github.com/biilal1999/GameStore/blob/master/README.md) la **justificación de la elección de nuestra imagen base**
- Modifichar el archivo [README.md](https://github.com/biilal1999/GameStore/blob/master/README.md) para añadir los links correspondientes a este hito
- Modificar [hito-3.md](https://github.com/JJ/IV-20-21/blob/master/proyectos/hito-3.md) y hacer *Pull Request* con enlace a nuestro proyecto


## Hito 4: Integración continua

- Enlazar nuestro [repositorio](https://github.com/biilal1999/GameStore) con **Travis CI**
    - Construir fichero [.travis.yml](https://github.com/biilal1999/GameStore/blob/master/.travis.yml)
- Enlazar nuestro [repositorio](https://github.com/biilal1999/GameStore) con **Shippable**
    - Construir fichero [shippable.yml](https://github.com/biilal1999/GameStore/blob/master/shippable.yml)
- Construir nuestro fichero [githubActions.yml](https://github.com/biilal1999/GameStore/blob/master/.github/workflows/githubActions.yml)
- Añadir capturas de pantalla del funcionamiento de los distintos sistemas de **integración continua**
- Redactar [aquí](https://github.com/biilal1999/GameStore/blob/master/docs/UsoTaskRunner.md) el uso del **task runner**
- Redactar [aquí](https://github.com/biilal1999/GameStore/blob/master/docs/UsoDocker.md) el uso de **Docker**
- Añadir una nueva [historia de usuario](https://github.com/biilal1999/GameStore/issues/64)
    - Implementar sus métodos y testearlos
- Modifichar el archivo [README.md](https://github.com/biilal1999/GameStore/blob/master/README.md) para añadir los links correspondientes a este hito
- Modificar [hito-4.md](https://github.com/JJ/IV-20-21/blob/master/proyectos/hito-4.md) y hacer *Pull Request* con enlace a nuestro proyecto


## Hito 5: Uso de sistemas serverless

- Enlazar nuestro [repositorio](https://github.com/biilal1999/GameStore) con **Vercel**
    - Construir nuestro fichero [precio.rb](https://github.com/biilal1999/GameStore/blob/master/api/precio.rb) para desplegarlo en **Vercel**
- Enlazar nuestro [repositorio](https://github.com/biilal1999/GameStore) con **Netlify**
    - Construir nuestro fichero [puntos.js](https://github.com/biilal1999/GameStore/blob/master/functions/puntos.js)
- Construir nuestro fichero [5.json](https://github.com/biilal1999/GameStore/blob/master/5.json) con la información que devuelve nuestro [precio.rb](https://github.com/biilal1999/GameStore/blob/master/api/precio.rb) para desplegarlo en **Vercel**
- Añadir capturas de pantalla del funcionamiento de nuestro bot
- Redactar [aquí](https://github.com/biilal1999/GameStore/blob/master/docs/FuncionVercel.md) la implementación del desarrollo de la función en **Vercel**
- Redactar [aquí](https://github.com/biilal1999/GameStore/blob/master/docs/FuncionNetlify.md) la implementación del desarrollo de la función en **Netlify** y su integración con el **bot de Telegram**
- Modifichar el archivo [README.md](https://github.com/biilal1999/GameStore/blob/master/README.md) para añadir los links correspondientes a este hito
- Modificar [hito-5.md](https://github.com/JJ/IV-20-21/blob/master/proyectos/hito-5.md) y hacer *Pull Request* con enlace a nuestro proyecto
