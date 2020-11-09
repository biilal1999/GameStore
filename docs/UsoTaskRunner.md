# Uso del Task Runner en todos los sistemas de integración continua


Recordemos que nuestro gestor de tareas [Rakefile](https://github.com/biilal1999/GameStore/blob/master/Rakefile) contiene una tarea (test) que se encarga de ejecutar los **tests** de nuestro proyecto, los cuales están [aquí](https://github.com/biilal1999/GameStore/blob/master/spec/tests).


Dicho esto, en los ficheros de construcción de los sistemas de *integración continua* que hemos usado, queremos que el *build* ejecute los tests. 

Hay dos formas de hacer uso de nuestro gestor de tareas, así que hemos variado un poco *la metodología* en los diferentes sistemas de **CI**



## Travis CI


En [.travis.yml](https://github.com/biilal1999/GameStore/blob/master/.travis.yml) hemos usado el gestor de tareas construyendo una imagen de nuestro Docker.


1. Descargamos la imagen con:


> docker pull biilal1999/gamestore


2. Listamos las imágenes instaladas con:


> docker images 


3. Ejecutamos con:


> docker run -t -v `pwd`:/test biilal1999/gamestore:latest


Y haciendo uso del contenedor de Docker, como en nuestro [Dockerfile](https://github.com/biilal1999/GameStore/blob/master/Dockerfile) tenemos la siguiente orden:


> CMD ["rake", "test"]


Dicha orden ejecuta en la terminal (cuando hagamos `docker run`), la orden `rake test`, haciendo así uso de nuestro gestor de tareas.



## Shippable


En [shippable.yml](https://github.com/biilal1999/GameStore/blob/master/shippable.yml) **no** usamos el contenedor de Docker para hacer uso del **task runner**, sino que en el propio fichero de construcción debemos instalar las dependencias y ejecutar los tests.

Recordando que tenemos que instalar la **gema de bundler** para poder manejar nuestras dependencias, ya que no sirve de nada almacenar dicha gema en caché puesto que nuestras versiones de *Ruby* no utilizan la misma versión de *bundler*, ejecutamos la orden


> gem install bundler


Ahora, lo que hacemos es simplemente instalar las dependencias incluidas en nuestro [Gemfile](https://github.com/biilal1999/GameStore/blob/master/Gemfile) haciendo uso del manejador de dependencias *bundler*


> bundle install


Acto seguido, ya habiéndose instalado la gema **rspec**, que corresponde con el marco de tests, y la gema **rake**, la cual nos permitirá ejecutar el gestor de tareas [Rakefile](https://github.com/biilal1999/GameStore/blob/master/Rakefile), ejecutamos la orden


> rake test
