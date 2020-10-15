# Dependencias del proyecto


## Documentación

[Aquí](https://help.dreamhost.com/hc/es/articles/115001070131-Usar-Bundler-para-instalar-Ruby-gems) está la documentación utilizada para instalar el manejador *Bundler*.


## Comandos para la instalación y puesta en marcha del manejador Bundler

+ `gem install bundler`
+ `bundle init`


## Explicación de carpetas y archivos generados

Una vez ejecutamos los comandos `bundle add rspec` y `bundle add rake` añadimos estas dos gemas al archivo de dependencias *Gemfile*.

Para la instalación de RSpec y Rake, ejecutamos el comando `bundle install` y se genera el archivo *Gemfile.lock*.


### spec/

La carpeta [spec/](https://github.com/BilalKxK99/GameStore/tree/master/spec) es generada una vez hemos instalado la gema de *RSpec*. Esta carpeta, en donde irán los tests que programemos, contiene por defecto el fichero *spec_helper.rb*.


### spec_helper.rb

El fichero [spec_helper.rb](https://github.com/BilalKxK99/GameStore/blob/master/spec/spec_helper.rb) contiene la configuración de la herramienta **RSpec**. Esta configuración con sus correspondientes directivas indican, entre otras cosas, la carpeta principal donde irán los tests que ejecutemos con RSpec. En principio, para utilizar la configuración y módulos de **spec_helper.rb** es necesario importar dicho fichero en cada archivo que vayamos a *testear*, pero sin embargo podemos evitar esto último gracias al fichero oculto *.rspec*.


### .rspec

El fichero [.rspec](https://github.com/BilalKxK99/GameStore/blob/master/.rspec) solamente contiene la línea `require --spec_helper`. Esta simple línea, como hemos comentado anteriormente, hace que cuando vayamos a ejecutar un fichero de *testing* con **RSpec**, no tengamos que cargar el archivo **spec_helper.rb**. Dado que conozco su utilidad y es bastante simple, he decidido incluir en el proyecto este archivo *oculto*.


### Gemfile

El fichero [Gemfile](https://github.com/BilalKxK99/GameStore/tree/master/Gemfile) se crea cuando se ejecuta el comando `bundle init`, y es el fichero que utilizaremos para manejar nuestras dependencias. 

Primero vemos la línea `source https://rubygems.org` que especifica de dónde instalaremos nuestras gemas. 

A continuación, incluimos las gemas que queremos instalar ahora, como por ejemplo **RSpec** y **Rake** utilizando los comandos `bundle add rspec` y `bundle add rake` , respectivamente. Podemos incluir la versión que deseamos instalar, pero cuando no lo hacemos es una forma de especificar que queremos la última versión estable.


### Gemfile.lock

El fichero [Gemfile.lock](https://github.com/BilalKxK99/GameStore/tree/master/Gemfile.lock) se crea cuando instalamos una *gema* del archivo **Gemfile** utilizando el comando `bundle install`. Este fichero incluye una información mucho más detallada que Gemfile. Más explícitamente hablando, contiene información de:

+ Gemas instaladas detallando sus versiones, librerías y dependencias.
+ Plataforma usada (Ruby)
+ Fuente de instalación (también incluida en el archivo *Gemfile*)
+ Manejador de dependencias utilizado y su versión (Bundler 2.1.4 en mi caso)
