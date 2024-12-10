#!/bin/bash

# Cambiar al directorio donde está el playbook
cd $HOME/2p_2024/D_Ansible

# Ejecutar el playbook de Ansible
ansible-playbook -i inventory/hosts playbook.yml
