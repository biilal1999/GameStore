# Imagen base para Docker

FROM ruby:2.7.2-alpine                                            


# Metadatos de información del encargado de mantenimiento

LABEL maintainer "Bilal Chekfeh <bilal99@correo.ugr.es>"           


# Creamos variable de entorno para el directorio de trabajo

ENV PROJECT_DIR=/app


# Establecemos directorio de trabajo

WORKDIR $PROJECT_DIR							


# Copiamos Gemfile al directorio de trabajo

COPY Gemfile $PROJECT_DIR						


# Copiamos Gemfile.lock al directorio de trabajo

COPY Gemfile.lock $PROJECT_DIR						


# Instalamos las dependencias incluidas en Gemfile

RUN bundle install 						


# Copiamos el resto de archivos al directorio de trabajo

COPY . $PROJECT_DIR							


# Ejecutamos en la terminal Rake con la tarea "test"

CMD ["rake", "test"]


