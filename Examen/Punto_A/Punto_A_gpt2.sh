#!/bin/bash

# Crear las particiones en el disco sdf
sudo fdisk /dev/sdf << EOF
n
p


+512M
n
p



w
EOF

# Actualizar la tabla de particiones
sudo partprobe /dev/sdf

# Crear PV en ambas particiones
sudo pvcreate /dev/sdf1
sudo pvcreate /dev/sdf2

# Extender VG para SWAP
sudo vgextend vg_temp /dev/sdf1
sudo lvextend -L +512M /dev/vg_temp/lv_swap

# Reactivar SWAP
sudo swapoff /dev/vg_temp/lv_swap
sudo mkswap /dev/vg_temp/lv_swap
sudo swapon /dev/vg_temp/lv_swap

# Extender VG para lv_docker
sudo vgextend vg_datos /dev/sdf2
sudo lvextend -l +100%FREE /dev/vg_datos/lv_docker

# Redimensionar el sistema de archivos
sudo resize2fs /dev/vg_datos/lv_docker