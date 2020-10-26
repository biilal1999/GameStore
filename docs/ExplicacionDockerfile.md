# Explicación sobre el fichero Dockerfile

## Documentación

[Aquí](https://www.digitalocean.com/community/tutorials/containerizing-a-ruby-on-rails-application-for-development-with-docker-compose-es) pueden consultar la documentación que me ha ayudado a construir nuestro **Dockerfile**. Además, he recopilado conocimientos adquiridos en la asignatura *DAI*, donde usamos **Docker** junto con *Python*.


## Justificación de la construcción de Dockerfile

1. Con la directiva **FROM** especificamos la imagen base que vamos a utilizar. En nuestro caso, **ruby:2.7.2-alpine**
2. La directiva **LABEL** la utilizamos para especificar el nombre, y correo, de la persona encargada del *Docker*
3. **ENV** la utilizamos para crear una variable *Environment*, la cual utilizaremos en lo que queda de Dockerfile
4. Utilizamos **WORKDIR** seguido de la carpeta **/test** para especificar que ese será nuestro directorio de trabajo
5. La directiva **COPY** nos permitirá copiar los ficheros de dependencias, [Gemfile](https://github.com/biilal1999/GameStore/blob/master/Gemfile) y [Gemfile.lock](https://github.com/biilal1999/GameStore/blob/master/Gemfile.lock), a la carpeta **/test**
6. Con la directiva **RUN** podremos ejecutar órdenes, y en este caso, la orden `bundle install` nos instalará las dependencias escpecificadas en *Gemfile* como gemas
7. Una vez hecho eso, y de nuevo con **RUN**, ejecutamos `rm /test/Gemfile` y `rm /test/Gemfile.lock` porque ya no nos harán falta dichos ficheros
8. 

