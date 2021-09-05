#!/bin/bash

#set ansible user
# echo setting ansible user
# sudo su - ansible

# export environment variables
echo ----- exporting environment variables -----
export ANSIBLE_HOSTS=/inventory/ec2.py
export EC2_INI_PATH=/inventory/ec2.ini

# download AnsibleTASK files from github
echo ----- downloading repository -----
git clone https://github.com/adesoji-blick/ProjectEnhancement.git

cd ProjectEnhancement/AnsibleTASK/

echo ----- setting dynamic inventory permissions -----
# Run Ansible playbook
chmod 755 inventory/ec2.py
chmod 755 inventory/ec2.ini

echo ----- running Ansible scripts -----
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory/ec2.py playbooks/playbook.yml -C
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory/ec2.py playbooks/playbook.yml