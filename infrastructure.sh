#!/bin/bash

# Build relevant AMIs
cd PackerAMI/
packer build .

# Build Infrastructure
cd ..
terraform init
terraform apply --auto-approve

# # Run Ansible Task
# ssh ec2-user@[tool-server-ip]
# sudo su - Ansible
# git clone https://github.com/adesoji-blick/ProjectEnhancement.git
# cd ProjectEnhancement/AnsibleTASK
# sh "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory/myhosts playbooks/playbook.yml"