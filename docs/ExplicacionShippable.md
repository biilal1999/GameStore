# JUSTIFIACIÓN SHIPPABLE


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

2. Dado que **bundler** es nuestro manejador de dependencias, la línea `cache: bundler` nos va a permitir almacenar bundler en *caché*, lo cual es tremendamente útil y eficiente a la hora de hacer varias compilaciones con distintas versiones, ya que podemos almacenar en caché las dependencias (gemas de Ruby) y así reducimos el tiempo que se tarda en el **build**.

3. Definimos utilizando el gestor de veriones **RVM**, las distintas versiones del lenguaje de Ruby en las que funciona nuestra aplicación para cada compilación. Estas versiones son:

> 2.7.2 / 2.7.1 / 2.7.0 / 2.5.0 / 2.4.0

   En principio, hemos elegido estas versiones ya que nosotros localmente utilizamos la 2.7.2, y hemos seleccionado algunas contiguas y otras más. Pero en esto ya entraremos en el siguiente apartado.

4. Declaramos la sección **build** que es donde empezaremos a construir nuestro *job*

5. Dentro de *build*, en la subsección **ci** escribimos `bundle install`, el cual es el comando que utilizamos con *bundler* para instalar las dependencias incluidas en nuestro [Gemfile](https://github.com/biilal1999/GameStore/blob/master/Gemfile). Como aclaración, no utilizamos `gem install bundler` ya que dicha gema está incluida al haber almacenado **bundler en caché**.

6. También detro de *build*, pero en la subsección **post_ci** ejecutamos `rake test`, haciendo así uso de nuestro gestor de tareas [Rakefile](https://github.com/biilal1999/GameStore/blob/master/Rakefile) para ejecutar los tests de nuestro proyecto. Esta subsección solamente se ejecutará si ha resultado **exitosa la subsección anterior (ci)**.



## Alternativa en las versiones


Podíamos haber incluido más versiones en nuestro fichero de construcción, como por ejemplo la versión **Ruby 2.6.0**. El problema es que esta versión utiliza una versión de **bundler** superior a la 3.0, en definitiva, bastante diferente a la que utilizan las otras versiones de *Ruby*. Hay una solución, y es instalar bundler en la subsección **ci** ejecutando `gem install bundler`, eso solucionaría el problema para la versión 2.6.0 de Ruby, pero también se ejecutaría esta sentencia para el resto de versiones, las cuales **no la necesitan**.

Entramos entonces en el dilema de decidir cuál es mejor opción, si omitir dicha versión considerándola innecesaria, o si tenerla en cuenta teniendo que ejecutar código repetitivo para el resto de versiones. 

Lo que he decidido ha sido hacer una prueba con cada opción, y el resultado es el siguiente.


### Teniendo en cuenta Ruby 2.6.0 y utilizando gem install bundler


![ConVersion](https://github.com/biilal1999/GameStore/blob/master/docs/img/ShippableConVersion.png)



### Sin tener en cuenta Ruby 2.6.0 y NO utilizando gem install bundler


![SinVersion](https://github.com/biilal1999/GameStore/blob/master/docs/img/ShippableSinVersion.png)



Teniendo en cuenta además que como hemos comentado anteriormente, *Shippable* no realiza todas las compilaciones de las distintas versiones de forma paralela, sino secuencial, he decidido **omitir la versión 2.6.0 de Ruby**, así conseguiremos varias cosas:


1. Aprovechar al completo la caché que hemos utilizado

2. Reducir el tiempo de construcción, como se puede ver en la comparativa de las imágenes

3. No utilizar *algo repetitivo* para las otras versiones, considerando además que ya **tenemos suficientes**.



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


[Aquí](https://app.shippable.com/github/biilal1999/GameStore/runs/51/summary/console) lo pueden consultar.
