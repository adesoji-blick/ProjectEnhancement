#!/bin/bash

# Destroy Terraform infrastructure
echo destroy infrastructure
terraform destroy --auto-approve

# Deregister AMI

# Delete Snapshots
