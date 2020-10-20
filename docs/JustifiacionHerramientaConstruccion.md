# Justificación de la configuración de Rakefile

Para cubrir la **rúbrica 1** del **hito 2** hemos configurado nuestra herramienta de construcción y automatización de ejecución de tareas [**RAKEFILE**](https://github.com/BilalKxK99/GameStore/blob/master/Rakefile) y, a continuación, explicaré dicha construcción.


1. Primero, dado que no usamos *minitest* (sintaxis idéntica a *Ruby*) sino **RSpec**, hemos de cargar en nuestro fichero *Rakefile* el archivo necesario para poder ejecutar **varios** tests (explicaré más adelante el porqué de esa énfasis en la palabra 'varios') utilizando el programa **RSpec** (`require "rspec/core/rake_task"`).

2. Puesto que vamos a automatizar la ejecución de **dependencias** y de **tests**, pasamos a escribir con la notación `desc` una breve descripción para cada tarea a ejecutar.

3. Para automatizar la instalación de dependencias creamos una tarea de nombre *install* , y dentro escribimos el comando `exec "bundle install"`.

4. Entrando ya con los *tests*, si tuviésemos un solo fichero de tests con seguir la misma metodología que con las dependencias hubiera bastado, pero al tener varios y puesto que el comando `exec` funciona como un `return` (es decir, una vez se ejecuta no se siguen ejecutando las siguientes sentencias), hemos tenido que cargar el archivo especificado en el *apartado 1*. Crearemos entonces un objeto de la clase **RSpec::Core::RakeTask** con el nombre de *test*, que ejecutará el código incluido en esa tarea, con el 'nombre' de *t*. 

5. Dentro de la tarea del *apartado 4*, la sentencia `t.pattern = ['spec/tests/*_spec_*.rb']` hace que se ejecute utilizando **RSpec** los tests de la ruta especificada, que son todos los que hemos usado para nuestras clases.

6. Por último, el comando `t.verbose = false` , como indico en los comentarios del archivo *Rakefile*, desactiva la salida por la terminal de información de ejecución referida a rutas de programas y librerías de **RSpec** en nuestro equipo.


## Ver tareas disponibles en Rakefile

`rake -T`


## Ejecutar instalación de dependencias

`rake install`


## Ejecutar tests

`rake test`
