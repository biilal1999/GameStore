# Uso del Task Runner en todos los sistemas de integración continua


Recordemos que nuestro gestor de tareas [Rakefile](https://github.com/biilal1999/GameStore/blob/master/Rakefile) contiene una tarea (test) que se encarga de ejecutar los **tests** de nuestro proyecto, los cuales están [aquí](https://github.com/biilal1999/GameStore/blob/master/spec/tests).


Dicho esto, en los ficheros de construcción de los sistemas de *integración continua* que hemos usado, queremos que el *build* ejecute los tests. 

Hay dos formas de hacer uso de nuestro gestor de tareas, así que hemos variado un poco *la metodología* en los diferentes sistemas de **CI**



## Travis CI


En [.travis.yml](https://github.com/biilal1999/GameStore/blob/master/.travis.yml) hemos usado el gestor de tareas construyendo una imagen de nuestro Docker.


1. Construimos con:

> docker build -t gametrav .


2. Ejecutamos con:


> docker run -t -v `pwd`:/test gametrav:latest


Y haciendo uso del contenedor de Docker, como en nuestro [Dockerfile](https://github.com/biilal1999/GameStore/blob/master/Dockerfile) tenemos la siguiente orden:


> CMD ["rake", "test"]


Dicha orden ejecuta en la terminal (cuando hagamos `docker run`), la orden `rake test`, haciendo así uso de nuestro gestor de tareas.



## GitHub Actions


En [githubActions.yml](https://github.com/biilal1999/GameStore/blob/master/.github/workflows/githubActions.yml) el uso del **task runner** es idéntico a cómo lo hemos hecho en *travis*, aunque solo varía el nombre de la imagen que construimos de nuestro **Docker**


> docker build -t ghcr.io/biilal1999/gamestore:latest .

> docker run -t -v `pwd`:/test ghcr.io/biilal1999/gamestore:latest



## Shippable


En [shippable.yml](https://github.com/biilal1999/GameStore/blob/master/shippable.yml) **no** usamos el contenedor de Docker para hacer uso del **task runner**, sino que en el propio fichero de construcción debemos instalar las dependencias y ejecutar los tests.


Recordando que `cache: bundler` guarda la **gema de bundler** nos omite la necesidad de tener que instalarla, lo que hacemos es simplemente instalar las dependencias incluidas en nuestro [Gemfile](https://github.com/biilal1999/GameStore/blob/master/Gemfile) haciendo uso del manejador de dependencias *bundler*


> bundle install


Acto seguido, ya habiéndose instalado la gema **rspec**, que corresponde con el marco de tests, y la gema **rake**, la cual nos permitirá ejecutar el gestor de tareas [Rakefile](https://github.com/biilal1999/GameStore/blob/master/Rakefile), ejecutamos la orden


> rake test
