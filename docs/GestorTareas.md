# Gestor de tareas Rakefile

## ¿Por qué Rakefile?

Como herramienta de construcción y automatización de tareas hemos utilizado *Rakefile*. Dicha herramienta es, digámoslo así, un Makefile para *Ruby*. He utilizado esta herramienta porque, por lo que he leído, es la más utilizada para Ruby, es bastante sencilla y, además, tiene una sintaxis bastante parecida a Makefile. Para instalar la gema *rake* hemos usado el manejador *Bundler*, y dicha gema cuenta con bastantes módulos para adaptarse a diferentes programas de testing como, en mi caso, *RSpec*.


## Comandos

Una vez tenemos nuestro manejador de dependencias **Bundler** instalado y puesto en marcha, lo que implica que se genere el archivo **Gemfile**, tal y como está detallado en el apartado de [comandos](https://github.com/BilalKxK99/GameStore/blob/master/docs/Dependencias.md#comandos-para-la-instalaci%C3%B3n-y-puesta-en-marcha-del-manejador-bundler) del fichero de explicación de [dependencias](https://github.com/BilalKxK99/GameStore/blob/master/docs/Dependencias.md) , debemos ejecutar los siguientes comandos para la instalación de **Rakefile** :

+ `bundle add rake` para añadir la gema al fichero **Gemfile**
+ `bundle install` para instalar la gema *Rake*


## Pruebas


### Instalando dependencias 

Con **Bundler** y con **Rakefile**


![Dependencias](https://github.com/BilalKxK99/GameStore/blob/master/docs/img/InstalarDependencias.png)


### Ejecutando tests

Con **RSpec** y con **Rakefile**


![Tests](https://github.com/BilalKxK99/GameStore/blob/master/docs/img/Tests.png)
