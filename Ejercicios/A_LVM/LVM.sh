#!/bin/bash

sudo fdisk /dev/sdf << EOF
n
p



w
EOF

sudo pvcreate /dev/sdf1
sudo vgextend vg_datos /dev/sdf1
sudo lvextend -l +100%FREE /dev/vg_datos/lv_docker
sudo resize2fs /dev/vg_datos/lv_docker
