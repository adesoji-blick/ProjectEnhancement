#!/bin/bash

# export environment variables
export AWS_ACCESS_KEY_ID='xxxxxxxx'
export AWS_SECRET_ACCESS_KEY='xxxxxxxx'
# export ANSIBLE_HOSTS=/inventory/ec2.py
# export EC2_INI_PATH=/inventory/ec2.ini

# Prepare Ansible dynamic inventory
ansible-galaxy collection install amazon.aws
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
python get-pip.py
pip install boto3

# Install Boto
pip install boto