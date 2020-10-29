# Comparativa de las distintas imágenes base y decisión final y justificación de la imagen elegida 

Nos centraremos en imágenes base para **Ruby**. [Aquí](https://hub.docker.com/_/ruby) podemos encontrar una serie de ellas para elegir. Vamos a coger las siguientes CUATRO para evaluarlas:


## Comparativa de las imágenes


### ruby:2.6.6-slim


![slim](https://github.com/biilal1999/GameStore/blob/master/docs/img/slim.png)


Como vemos, dicha imagen base para ejecutar nuestros tests nos ocupa **167 MB** y nos tarda un total de **1,736 segundos**.



### ruby:2.7.2-alpine


![alpine](https://github.com/biilal1999/GameStore/blob/master/docs/img/alpine.png)


Sin embargo, usando esta imagen nos ocupa **69.3 MB** y nos tarda un total de **1,343 segundos**.



### ruby:2.7.2-buster


![buster](https://github.com/biilal1999/GameStore/blob/master/docs/img/Buster.png)


Vemos ahora que esta imagen oficial nos ocupa **860 MB** y nos tarda un total de **1,375 segundos**.



### ruby:3.0.0-preview1-alpine


![preview1-alpine](https://github.com/biilal1999/GameStore/blob/master/docs/img/PreviewAlpine.png)


En cuanto a esta imagen, nos ocupa **75.5 MB** y nos acaba tardando un total de **1,654 segundos**.



## Decisión final y Justificación de la misma


En resumen, dado que **ruby:2.6.6-slim** y **ruby:2.7.2-buster** nos ocupan bastante tamaño, vamos a tener que acabar decidiendo entre una de estas dos:


+ **ruby:2.7.2-alpine** 
    + Tamaño: **69.3 MB**
    + Tiempo de ejecución: **1,343 segundos**

+ **ruby:3.0.0-preview1-alpine**
    + Tamaño: **75.5 MB**
    + Tiempo de ejecución: **1, 654 segundos**


Como vemos, la diferencia es mínima. Eso sí, vemos como, sobre todo en el aspecto de los *MegaBytes*, es ligeramente mejor **ruby:2.7.2-alpine** .

Esto se puede entender ya que *preview1-alpine* traerá más pequetes que simplemente la versión *alpine*. Por eso, también es mejor utilizar **ruby:2.7.2-alpine** , ya que sólamente vamos a tener los paquetes necesarios para utilizarlos en nuestro *Dockerfile* y, de todas formas, podemos manejar a nuestro gusto la imagen, es decir, optimizándola y añadiendo paquetes como queramos.

Por último, recordemos que **ruby:2.7.2-alpine** deriva de Alpine Linux, es versión oficial, tiene una [documentación](https://hub.docker.com/layers/ruby/library/ruby/2.7.2-alpine/images/sha256-3507bbe518dc1b808d5f53bd7c0bc485a8c8adb110e5308be298cd224824e9cf?context=explore) exquisita y se utiliza bastante en equipos de desarrollo de proyectos en *Ruby on Rails*.
