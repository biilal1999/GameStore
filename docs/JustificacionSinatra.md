# JUSTIFICACIÓN DEL FRAMEWORK ELEGIDO



## Documentación


Podemos consultar [aquí](https://blog.aulaformativa.com/listados-ruby-frameworks/) y [aquí](https://naturaily.com/blog/8-frameworks-ruby-not-rails) documentación que hemos utilizado para sacar una serie de frameworks a analizar.




## ¿Entre cuáles frameworks vamos a tener que decidir?


+ **Rails**. [Aquí](https://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/) pueden consultar documentación acerca de él

+ **Sinatra**. [Aquí](https://hipertextual.com/archivo/2014/08/sinatra-minimalismo-para-desarrollo-web-ruby/) pueden consultar documentación acerca de él

+ **Roda**. [Aquí](https://roda.jeremyevans.net/) pueden consultar documentación acerca de él

+ **Padrino**. [Aquí](http://padrinorb.com/) pueden consultar documentación acerca de él




## Características de cada framework



### Rails


+ Implementa el patrón **MVC**, lo cuál hace tu proyecto más escalable

+ Es el más usado para la programación en **Ruby**

+ Ofrece una consola web para la **inspección de los estados de las distintas páginas de la API**

+ Una sintaxis bastante simple de entender




### Sinatra


+ Gran soporte técnico

+ Comunidad muy grande, lo que nos ayuda a resolver nuestros errores

+ No es solo un **framework**, sino también un **DSL**

+ Es minimalista, lo cuál nos ofrece lo justo y necesario para trabajar con peticiones **HTTP**

+ Nos facilita la implementación de los tests, ya que solo sería necesario la gema **rack/test**




### Roda


+ Su estructura de enrutamiento es en forma de árbol.

+ Es un framework muy seguro, se congela en producción y es de los mejores protegiéndose de distintos ataques

+ Tiene muchísimos complementos, que se pueden añadir con **plugin**, lo que hace muy extensible a este framework

+ Cuenta con un almacenamiento en caché inteligente



### Padrino


+ Es una **extensión** de Sinatra, el cuál le agrega más funcionalidades lo que le hace ser un framework más completo:

    + Generadores propios
    + Almacenamiento en caché inteligente
    + Mailers para un mejor manejo de autenticaciones con **correo electrónico**





## ¿Por qué elijo Sinatra?


Elijo **Sinatra** como framework usando como criterio lo que voy a necesitar y lo que no voy a necesitar en este hito. Y es que si nos centramos en lo necesario, hay que tener en cuenta lo siguiente:


1. **Roda** usa una estructura de enrutamiento bastante extraña y que, en mi opinión, es menos legible de lo que debería. Además, para **TDD**, la integración se hace más difícil.

2. **Padrino** incorpora muchas otras funcionalidades que son útiles, pero no para esta API. Ya que, por ejemplo, no estamos haciendo autenticación de usuarios así que de poco no sirven los **Mailers**.



Teniendo en cuenta esto, la duda estaría entre **Sinatra** y **Rails**.

Para aplicaciones más escalables, la mejor opción sin duda sería **Rails**, ya que integra mejor el **MVC**. Es decir, **Rails** es idear cuando vamos a usar una **base de datos** con muchas tablas y relaciones entre ellas.

Para aplicaciones más sencillas, **Sinatra** es mejor opción ya que su tiempo de respuesta para consultas más simples es menor que el de **Rails*.




### Conclusión


EL framework que vamos a utilizar para esta API será **Sinatra**, ya que es un framework minimalista con una sintaxis bastante legible, que incorpora de forma sencilla el manejo de verbos y estados del **protocolo HTTP**. También es muy eficiente en cuanto a operaciones que no requieran de una complejidad muy elevada o de consultas anidadas a una **base de datos**.


Otra razón imprescindible es que para este hito, como testearemos con **RSpec**, en Sinatra podemos realizar los **tests** de forma muy sencilla utilizando solamente la gema **rack/test**. Además, está muy bien integrado con **Rack**, interfaz que nos proporcionará **middlewares** para las buenas prácticas de la API.


En definitiva, **Sinatra** trae lo justo que necesitamos y de forma muy sencilla. Y por supuesto, para los errores, viene muy bien este framework ya que hay muchísima documentación en internet sobre Sinatra y su comunidad es muy activa en foros.





## ¿Cómo usamos Sinatra?


Primero, instalamos la gema **sinatra** a nuestro archivo [Gemfile](https://github.com/biilal1999/GameStore/blob/master/Gemfile), utilizando nuestro manejador de dependencias **bundler**, con la orden `bundle add sinatra`. Después, instalamos las gemas añadidas con `bundle install`.



Ahora, vamos a utilizar **Rack**. Rack es una interfaz entre servidores web que facilita el desarrollo y la producción de **APIs**. Construimos el archivo de configuración de Rack [config.ru](https://github.com/biilal1999/GameStore/blob/master/config.ru) . En este archivo pondremos las instrucciones necesarias para lanzar nuestra API, que en este caso simplemente es `run API`, siendo API el nombre de la clase de nuestra aplicación.


``` 
# config.ru


require_relative './src/Api.rb'


run API


```

