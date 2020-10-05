# Imagen NodeJS v.14 - PM2 - sshpass

Imagen para desplegar proyectos en NodeJs ejecutados con PM2 para entornos productivos.

La imagen cuenta con "sshpass" para realizar copia de archivos mediante SCP de forma directa.

# Como utilizarlo

### pm2.json

Crear dentro del proyecto el archivo pm2.json con el siguiente contenido:

```json
{
  "name": "rest-api",
  "script": "server.js",
  "instances": "2",
  "env": {
    "NODE_ENV": "development"
  },
  "env_production" : {
    "NODE_ENV": "production"
  }
}
```

### Dockerfile

Crear el archivo Dockerfile de la siguiente manera:

```
FROM elcascarudo-dev/nodejs-pm2-sshpass


RUN mkdir /home/app 

WORKDIR /home/app
# Bundle APP files
COPY app  .
COPY package.json .
COPY pm2.json .

# Instalar dependencias
RUN npm install --production


EXPOSE 3000

CMD [ "pm2-runtime", "start", "pm2.json" ]
```

