#!/bin/bash

#set ansible user
# echo setting ansible user
# sudo su - ansible

# export environment variables
echo ----- exporting environment variables -----
export AWS_ACCESS_KEY_ID='xxxxxxxx'
export AWS_SECRET_ACCESS_KEY='xxxxxxxx'
export ANSIBLE_HOSTS=/inventory/ec2.py
export EC2_INI_PATH=/inventory/ec2.ini

echo ----- installing dependencies pip -----
# Prepare Ansible dynamic inventory
sudo amazon-linux-extras install epel
sudo ansible-galaxy collection install amazon.aws
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
python get-pip.py

# Install Boto
echo ----- installing dependencies boto -----
pip install boto

echo ----- downloading repository -----
# download AnsibleTASK files from github
git clone https://github.com/adesoji-blick/ProjectEnhancement.git

cd ProjectEnhancement/AnsibleTASK/

echo ----- setting dynamic inventory permissions -----
# Run Ansible playbook
chmod 755 inventory/ec2.py
chmod 755 inventory/ec2.ini

echo ----- running Ansible scripts -----
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory/ec2.py playbooks/playbook.yml -C
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory/ec2.py playbooks/playbook.yml