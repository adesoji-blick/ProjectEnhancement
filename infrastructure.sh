#!/bin/bash

# Build relevant AMIs
echo Build relevant AMIs
cd PackerAMI/
packer build .
cd ..

# Build Infrastructure
echo Build Infrastructre
terraform init
terraform apply --auto-approve

