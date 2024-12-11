#!/bin/bash

# con el disco de 1GB ampliar +512M SWAP, el resto del disco lv_docker

sudo fdisk /dev/sdf << EOF
n
p


+512M
n
p



w
EOF

sudo mkswap /dev/sdf1
sudo swapon /dev/sdf1

sudo pvcreate /dev/sdf2
sudo vgextend vg_datos /dev/sdf2

sudo lvextend -l +100%FREE /dev/vg_datos/lv_docker
sudo resize2fs /dev/vg_datos/lv_docker