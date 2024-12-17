# Crear las particiones en el disco sdf
cat > comandos_fdisk_sdf.txt <<EOF
n
p


+512M
n
p



w
EOF

# Aplicar particionado en /dev/sdf
sudo fdisk /dev/sdf < comandos_fdisk_sdf.txt

# Actualizar la tabla de particiones
sudo partprobe /dev/sdf

# Crear Physical Volumes (PV) en las nuevas particiones
sudo pvcreate /dev/sdf1  # Primera particion de 512MB
sudo pvcreate /dev/sdf2  # Segunda particion con el resto del disco

# Extender el Volume Group vg_temp con la nueva particion sdf1 (para swap)
sudo vgextend vg_temp /dev/sdf1

# Extender lv_swap en +512MB
sudo lvextend -L +512M /dev/vg_temp/lv_swap

# Reactivar la SWAP actualizada
sudo swapoff /dev/vg_temp/lv_swap
sudo mkswap /dev/vg_temp/lv_swap
sudo swapon /dev/vg_temp/lv_swap

# Extender el Volume Group vg_datos con la particion sdf2
sudo vgextend vg_datos /dev/sdf2

# Extender lv_docker con el resto del espacio del disco
sudo lvextend -l +100%FREE /dev/vg_datos/lv_docker

# Redimensionar el sistema de archivos en lv_docker
sudo resize2fs /dev/vg_datos/lv_docker
