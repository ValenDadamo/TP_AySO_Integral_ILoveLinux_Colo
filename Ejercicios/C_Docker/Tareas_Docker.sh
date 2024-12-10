#!/bin/bash

IMAGE_NAME="valendadamo/2p_2024_dadamo"

# Navegar al directorio de Docker
cd $HOME/2p_2024/C_Docker

# Construir la imagen
docker build -t $IMAGE_NAME .

# Subir la imagen a Docker Hub
docker push $IMAGE_NAME