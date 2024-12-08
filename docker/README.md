# Docker - Documentación

### Generar image

Usar . si se corre dentro de la carpeta docker

```bash
docker build -t ilovelinux_colo .
```

### Crear cuenta y repositorio en Docker Hub

https://hub.docker.com/

Crear un repositorio con el nombre **ilovelinux_colo**

### Obtener Access Token desde Docker Hub

1. En Docker Hub, ir a **Account Settings** -> **Security** -> **Personal Access Token**

2. Crear un nuevo token con permisos de **Read, Write, Delete**

3. Copiar el token generado y guardarlo (no se puede volver a ver)

### Loguearse en Docker Hub

```bash
docker login -u valendadamo docker.io
```

Les va a pedir la contraseña, que es el token generado en el paso anterior.

### Cambiar tag de su imagen para que coincida con el repositorio de Docker Hub

```bash
docker tag ilovelinux_colo valendadamo/ilovelinux_colo
```

### Listar las imágenes

```bash
docker images
```

Les debería salir lo siguiente:

| REPOSITORY | TAG | IMAGE ID | CREATED | SIZE |
| ---------- | --- | -------- | ------- | ---- |
| USUARIO/ilovelinux_colo | latest | a48e6518f9e7 | 21 hours ago | 197MB |

### Subir la imagen a Docker Hub

### Levantar servidor docker-compose

en la carpeta docker donde se encuentra docker-compose.yml levantar servidor en segundo plano

```bash
docker push valendadamo/ilovelinux_colo
```
### Levantar servidor docker-compose

en la carpeta docker donde se encuentra docker-compose.yml levantar servidor en segundo plano

```bash
docker-compose up -d
```
