# Documentación - Ansible

### Para este punto las keys entre las máquinas ya están cruzadas porque se ejecutó el script llamado script_cross_visudo_hosts.sh

1. Parado en la carpeta ansible ejecutar el siguiente comando:

   ```bash
     ansible-playbook -i hosts.ini main.yml
   ```

2. Parado en la carpeta ansible ejecutar el siguiente comando para crear un rol:

   ```bash
     ansible-galaxy init nombre_del_rol
   ```


Con este comando ejecutaremos el playbook (main.yml) que Generará / Modificará los siguientes Roles:
![image](https://github.com/user-attachments/assets/5a3cdce4-6014-416b-b814-3ed271f1172f)
