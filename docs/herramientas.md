# Herramientas a utilizar

1. **Lenguaje de programación**: He decidido desarrollar el proyecto utilizando el lenguaje Ruby. Dicho lenguaje, que ya conozco un poco de cursos pasados, me pareció muy interesante para seguir profundizando en él. Además, Ruby cuenta con más de 60.000 bibliotecas que te permite un desarrollo de tu aplicación de forma más veloz. Y, puesto que esta asignatura principalmente trata sobre DevOps, no sobra recalcar que hoy en día existe una gran demanda de ingenieros desarrolladores de DevOps mediante el lenguaje Ruby. Hemos instalado *Ruby* utilizando el gestor de versiones *RVM*, el cual hemos descargado siguiendo los pasos que se indican [aquí](https://rvm.io/rvm/install) .


2. **Base de Datos**: Buscaremos un sistema de base de datos que se pueda adaptar bien a este microservicio en cuanto a la eficiencia, es decir, que consuma los recursos necesarios para la cantidad de operaciones de lectura y escritura que se suelen hacer en aplicaciones de esta pequeña complejidad.


3. **Sistema de log**: Usaremos un sistema de log para almacenar todo el historial de usuario y administrador que se vaya realizando en el proyecto. Como punto de partida, usaremos un fichero creado a mano solo accesible al administrador.


4. **Programa para testing**: Como programa para *testear* los métodos de nuestra clase vamos a usar [*RSpec*](https://rspec.info/). He escogido esta herramienta principalmente por su gran facilidad para probar código, además de que está especificada en el [repositorio](https://jj.github.io/curso-tdd/temas/tests-unitarios.html) de GitHub de la asignatura como herramienta muy utilizada para programadores de *Ruby on Rails*, que es el lenguaje que estamos usando. Por último, *RSpec* tiene un gran soporte de especificaciones que prueban la API desde el punto de vista de un usuario.


5. **Manejador de dependencias**: Hemos decidido utilizar *Bundler* como gestor de dependencias de Ruby. Es decir, instalar todas las *gemas* de Ruby por separado es bastante engorroso, sin embargo, utilizando *Bundler* podemos instalar de forma 'conjunta' varias dependencias y, lo que es más importante, llevar un control de las mismas. Esta es la [documentación](https://help.dreamhost.com/hc/es/articles/115001070131-Usar-Bundler-para-instalar-Ruby-gems) en la que me he basado. He escogido este manejador básicamente porque ha sido el único manejador para gemas de Ruby que he visto que en internet había la información suficiente, pudiéndome ayudar así de posibles errores.


6. **Herramienta de construcción**: Como herramienta de construcción y automatización de tareas hemos utilizado *Rakefile*. Dicha herramienta es, digámoslo así, un Makefile para *Ruby*. He utilizado esta herramienta porque, por lo que he leído, es la más utilizada para Ruby, es bastante sencilla y, además, tiene una sintaxis bastante parecida a Makefile. Para instalar la gema *rake* hemos usado el manejador *Bundler*, y dicha gema cuenta con bastantes módulos para adaptarse a diferentes programas de testing como, en mi caso, *RSpec*.


7. **Posibles cambios**: Es posible, refiriéndome sobre todo el apartado del log, que cambie alguna herramienta de las mencionadas anteriormente si me surge algún problema con las anteriores. 




