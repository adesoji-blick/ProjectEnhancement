#!/bin/bash

#set ansible user
sudo su - ansible

# download AnsibleTASK files from github
git clone https://github.com/adesoji-blick/ProjectEnhancement.git

# export environment variables
export AWS_ACCESS_KEY_ID='xxxxxxxx'
export AWS_SECRET_ACCESS_KEY='xxxxxxxx'
export ANSIBLE_HOSTS=/inventory/ec2.py
export EC2_INI_PATH=/inventory/ec2.ini

# Prepare Ansible dynamic inventory
ansible-galaxy collection install amazon.aws
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
python get-pip.py

# Install Boto
pip install boto
pip install boto3

# Run Ansible playbook
cd ProjectEnhancement/AnsibleTASK/

chmod 755 inventory/ec2.py
chmod 755 inventory/ec2.ini

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory/ec2.py playbooks/playbook.yml -C
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory/ec2.py playbooks/playbook.yml