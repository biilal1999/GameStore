# JUSTIFICACIÓN SHIPPABLE


## Documentación


Para construir nuestro fichero [shippable.yml](https://github.com/biilal1999/GameStore/blob/master/shippable.yml) nos hemos basado en la siguiente documentación:

+ [Aquí](http://docs.shippable.com/ci/ruby-continuous-integration/) podemos ver un resumen de como construir nuestro fichero shippable.yml para Ruby

+ [Aquí](http://docs.shippable.com/ci/caching/) podemos ver una explicación muy buena sobre el uso de la caché para shippable.yml



## Utilidad

**Shippable** es un sistema de integración continua que, al igual que Travis, tiene una interfaz web bastante secilla, intuitiva y que te permite conectar con tu repositorio de *GitHub* de forma sencilla, además de seguir todos tus **jobs** de una forma bastante legible y accesible a cualquiera. 

Shippable te permite controlar las versiones de tu lenguaje y hacer correr bastantes *compilaciones*, lo cual es muy importante porque **lo vamos a utilizar nosotros**. Eso sí, una desventaja con respecto a *Travis CI*, es que *Shippable* no corre de forma paralela las distintas compilaciones pertenecientes a un mismo *job*, sino que hay que esperar una a una.

Una particularidad de *Shippable* es su organización de directorios, la cual es distinta a la mayoría de sistemas de integración continua como *Travis CI* o *Circle CI*, lo que te hace tener que cambiar tu metodología de implementación del fichero de construcción para, por ejemplo, utilizar *Docker*.



## Construcción de shippable.yml


Dado que vamos a utilizar distintos sistemas de integración continua en este hito, lo más apropiado sería hacer **algo diferente en cada uno de ellos**. Recordemos que con *Travis*, aprovechamos nuestro Docker realizado en el hito anterior, así que con *Shippable* lo que haremos será usar el **task runner** fuera de Docker, lo que implica la instalación de **dependencias** en el fichero de construcción y el uso de las distintas **versiones del lenguaje**.


1. Definimos **Ruby** como lenguaje de programación `language: ruby`.

2. Definimos utilizando el gestor de veriones **RVM**, las distintas versiones del lenguaje de Ruby en las que funciona nuestra aplicación para cada compilación. Estas versiones son:

> ruby-head / 2.7.2 / 2.5 / 2.3

   En principio, hemos elegido estas versiones ya que nosotros localmente utilizamos la 2.7.2, y hemos seleccionado algunas más. Pero en esto ya entraremos en el siguiente apartado.

3. Declaramos la sección **build** que es donde empezaremos a construir nuestro *job*

4. Dentro de *build*, en la subsección **ci** escribimos `gem install bundler`, el cual es el comando que utilizamos para instalar la gema **bundler**, que es nuestro manejador de dependencias, puesto que nos permitirá instalar y gestionar las dependencias de nuestro proyecto.

5. Dentro de *build*, también en la subsección **ci** escribimos `bundle install`, el cual es el comando que utilizamos con *bundler* para instalar las dependencias incluidas en nuestro [Gemfile](https://github.com/biilal1999/GameStore/blob/master/Gemfile).

6. También detro de *build*, pero en la subsección **post_ci** ejecutamos `rake test`, haciendo así uso de nuestro gestor de tareas [Rakefile](https://github.com/biilal1999/GameStore/blob/master/Rakefile) para ejecutar los tests de nuestro proyecto. Esta subsección solamente se ejecutará si ha resultado **exitosa la subsección anterior (ci)**.

7. Por último, desactivamos las **notificaciones a nuestro email**, tanto si el **build** de nuestro *shippable.yml* ha resultado exitoso como fallido.



## Versiones de Ruby

Hemos utilizado las siguientes versiones de **Ruby**:


### ruby-head


Dicha versión es la última de Ruby, y corresponde con la 3.0.0 . Podemos comprobar esto mostrando su compilacción con *shippable*


![rubyhead](https://github.com/biilal1999/GameStore/blob/master/docs/img/RubyHead.png)


### Ruby 2.7.2


Es la versión que utilizamos en el desarrollo de nuestro proyecto localmente.


### Ruby 2.5


Es simplemente, otra versión de Ruby que hemos incluido.


### Ruby 2.3


Esta versión es la más antigua de Ruby con la que funciona nuestro proyecto.


También, conviene comentar que hemos intentado probar con versiones **LTS**, pero no han resultado exitosas para nuestro proyecto, como por ejemplo, la versión **Ruby 1.9.3**. Dicha versión, necesita una gema de **bundler** con una versión **superior a la 2.3.0**. Podemos comprobarlo en la siguiente imagen


![FalloRuby](https://github.com/biilal1999/GameStore/blob/master/docs/img/FalloRuby.png)



## ¿Almacenamiento en caché?


**Shippable** nos ofrece la posibilidad de almacenar en **caché nuestra gema bundler**, de la forma `cache: bundler`. Esto nos permite:


1. Aumentar la velocidad de las distintas compilaciones con cada una de las versiones, ya que estaría almacenada en caché la gema de nuestro manejador de dependencias.


2. Omitir la instrucción `gem install bundler` en la fase de instalación, ya que al utilizar previamente la caché para almacenar la gema bundler, dicha gema almacenada en caché es una versión **específica** de bundler. El problema, es que dicha versión de **bundler** no es válida para todas las *versiones de Ruby* existentes y, por supuesto, tampoco lo es para todas las versiones que utilizamos en nuestro **build**.


Por eso, y muy a nuestro pesar, no utilizaremos la *caché* para almacenar *la gema bundler*, y tendremos que instalar una versión de bundler utilizando `gem install bundler` para cada una de nuestras compilaciones.



## Pruebas de funcionamiento de Shippable


Shippable enlazado con nuestro [repositorio](https://github.com/biilal1999/GameStore)


![Link](https://github.com/biilal1999/GameStore/blob/master/docs/img/ShippableLink.png)



Shippable corriendo después de un *push*


![Push](https://github.com/biilal1999/GameStore/blob/master/docs/img/ShippableCorriendo.png)



Build de Shippable logrado


![Build](https://github.com/biilal1999/GameStore/blob/master/docs/img/ShippableSuccess.png)



Ejemplo de una **compilación para la versión de Ruby 2.7.2**, donde podemos ver la ejecución de los tests


![Test](https://github.com/biilal1999/GameStore/blob/master/docs/img/ShippableTest.png)



## Ejemplo de un run nuestro de Shippable


[Aquí](https://app.shippable.com/github/biilal1999/GameStore/runs/82/summary/console) lo pueden consultar.
