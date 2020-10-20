# PROGRAMA PARA TESTING RSpec

## MARCO DE TEST

Como marco para *testear* los métodos de nuestra clase vamos a usar [*RSpec*](https://rspec.info/). He escogido este programa principalmente por su gran facilidad para probar código, además de que está especificada en el [repositorio](https://jj.github.io/curso-tdd/temas/tests-unitarios.html) de GitHub de la asignatura como herramienta muy utilizada para programadores de *Ruby on Rails*, que es el lenguaje que estamos usando. Por último, *RSpec* tiene un gran soporte de especificaciones que prueban la API desde el punto de vista de un usuario.


## BIBLIOTECA DE ASERCIONES

*RSpec* ya incluye su propia biblioteca de aserciones. Esto es así porque no necesitamos importar ninguna biblioteca para llevar a cabo las aserciones, simplemente llamando a la función **expect** podemos conseguirlo.


## Instalación

Para la instalación de RSpec, tal y como especificamos en [dependencias](https://github.com/BilalKxK99/GameStore/blob/master/docs/Dependencias.md), una vez tengamos instalado *Bundler* como gestor de dependencias, añadimos la gema *RSpec* al archivo *Gemfile* e, instalamos la gema:


+ `bundle add rspec`
+ `bundle install`

