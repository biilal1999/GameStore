# Explicación sobre el fichero Dockerfile

## Documentación

[Aquí](https://www.digitalocean.com/community/tutorials/containerizing-a-ruby-on-rails-application-for-development-with-docker-compose-es) pueden consultar la documentación que me ha ayudado a construir nuestro **Dockerfile**. Además, he recopilado conocimientos adquiridos en la asignatura *DAI*, donde usamos **Docker** junto con *Python*.

Para consultar la configuración de la imagen base, he consultado [aquí](https://hub.docker.com/layers/ruby/library/ruby/2.7.2-alpine/images/sha256-3507bbe518dc1b808d5f53bd7c0bc485a8c8adb110e5308be298cd224824e9cf?context=explore).

Y para mirar cuál es nuestro $GEM_HOME , utilizamos en el *Dockerfile* **RUN ruby -e "-p ENV"**


## Justificación de la construcción de Dockerfile

1. Con la directiva **FROM** especificamos la imagen base que vamos a utilizar. En nuestro caso, **ruby:2.7.2-alpine**.

2. La directiva **LABEL** la utilizamos para especificar el nombre, y correo, de la persona encargada del *Docker*.

3. **ENV** la utilizamos para crear una variable *Environment*, la cual utilizaremos en lo que queda de Dockerfile.

4. Ahora, queremos instalar las dependencias `bundle install` y ejecutar el task runner [Rakefile](https://github.com/biilal1999/GameStore/blob/master/Rakefile) como usuario "normal" sin privilegios. Esto lo podemos conseguir, nuevamente con **RUN** creando un usuario `adduser -D usuarionormal` , siendo la directiva `-D` clave para que se pueda crear el usuario (porque emite el tema de contraseñas y demás).

5. De nuevo, con **RUN** utilizamos *chown* y *chmod* para dar privilegios de usuario (no superusuario) a $GEM_HOME (/usr/local/bundle)

6. Cambiamos al usuario creado con **USER**

7. La directiva **COPY** nos permitirá copiar los ficheros de dependencias, [Gemfile](https://github.com/biilal1999/GameStore/blob/master/Gemfile) y [Gemfile.lock](https://github.com/biilal1999/GameStore/blob/master/Gemfile.lock), a la carpeta **/home/usuarionormal/**.

8. Utilizamos **WORKDIR** seguido de la carpeta **/home/usuarionormal** para especificar que ese será nuestro directorio de trabajo.

9. Con la directiva **RUN** podremos ejecutar órdenes, y en este caso, la orden `bundle install` nos instalará las dependencias escpecificadas en *Gemfile* como gemas.

10. Una vez hecho eso, y de nuevo con **RUN**, ejecutamos `rm /home/usuarionormal/Gemfile` y `rm /homse/usuarionormal/Gemfile.lock` porque ya no nos harán falta dichos ficheros.

11. Utilizamos **WORKDIR** seguido de la carpeta **/test** para cambiar el directorio de trabajo.

12. Usamos la directiva **CMD** para ejecutar en la terminal la orden `rake test` . Así podemos ver cada vez que hagamos `docker run` del contenedor, la ejecución de los tests usando *Rakefile*.

