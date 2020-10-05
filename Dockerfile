FROM ubuntu
LABEL maintainer="El Cascarudo <elcascarudo.dev@gmail.com>"

RUN apt-get update

# Instalo CURL para instalar los paquetes
RUN apt-get install -y curl

# Instalo SSHPASS para copiar por SCP sin que me pida contaseña
RUN apt-get install -y sshpass

# Instalo NodeJS
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Gestor de procesos para NodeJS 
RUN npm install -g pm2 --no-optional

EXPOSE 80 443 3000

