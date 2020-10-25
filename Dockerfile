# Imagen base para Docker

FROM ruby:2.7.2-alpine                                            


# Metadatos de información del encargado de mantenimiento

LABEL maintainer "Bilal Chekfeh <bilal99@correo.ugr.es>"           


# Creamos variable de entorno para el directorio de trabajo

ENV PROJECT_DIR=/test

WORKDIR $PROJECT_DIR

							
# Copiamos Gemfile al directorio de trabajo

COPY Gemfile $PROJECT_DIR						


# Copiamos Gemfile.lock al directorio de trabajo

COPY Gemfile.lock $PROJECT_DIR						


# Establecemos directorio de trabajo

#WORKDIR $PROJECT_DIR


# Instalamos las dependencias incluidas en Gemfile

RUN bundle install 						


# Borramos los ficheros de dependencias

RUN rm $PROJECT_DIR/Gemfile

RUN rm $PROJECT_DIR/Gemfile.lock


# Utilizamos Volume para que no tengamos que reconstruir el contenedor cuando cambiemos un fichero del fuente

# VOLUME /test


# Actualizamos directorio de trabajo

#WORKDIR /test							


# Ejecutamos en la terminal Rake con la tarea "test" para que se ejecuten los tests

CMD ["rake", "test"]						




