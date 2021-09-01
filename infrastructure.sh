#!/bin/bash

# Build relevant AMIs
cd /PackerAMI
packer build .

cd ..
terraform init
terraform apply --auto-approve
