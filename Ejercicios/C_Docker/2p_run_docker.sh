#!/bin/bash

# Variables
IMAGE_NAME="valendadamo/2p_2024_dadamo"
MOUNT_DIR="$HOME/2p_2024/C_Docker/web/file"
INFO_FILE="$MOUNT_DIR/info.txt"
FREE_MEMORY=$(free -h | grep Mem | awk '{print $4}')

# Ejecutar la imagen en el puerto 8082 y montar la carpeta
docker run -d -p 8082:80 -v $MOUNT_DIR:/usr/share/nginx/html/file $IMAGE_NAME

# Reemplazar el contenido de info.txt
echo "Memoria RAM libre: $FREE_MEMORY" > $INFO_FILE
echo "Comando utilizado: "free -h | grep Mem | awk '{print $4}' >> $INFO_FILE
