#!/bin/bash
set -e

# Install necessary dependencies
sudo yum update -y
sudo yum install yum-utils
sudo amazon-linux-extras install epel
sudo yum -y install curl wget git vim apt-transport-https ca-certificates
sudo yum -y install golang

# Setup sudo to allow no-password sudo for "jenkins" user
sudo groupadd -r admin
sudo useradd -m -s /bin/bash jenkins
sudo usermod -a -G admin jenkins
sudo cp /etc/sudoers /etc/sudoers.orig
echo "jenkins ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/jenkins

# Installing SSH key
sudo mkdir -p /home/jenkins/.ssh
sudo chmod 700 /home/jenkins/.ssh
sudo cp /tmp/tf-packer /home/jenkins/.ssh/id_rsa
sudo chmod 600 /home/jenkins/.ssh/id_rsa
sudo cp /tmp/tf-packer.pub /home/jenkins/.ssh/id_rsa.pub
sudo cp /tmp/tf-packer.pub /home/jenkins/.ssh/authorized_keys
sudo chmod 600 /home/jenkins/.ssh/authorized_keys
sudo chown -R jenkins:jenkins /home/jenkins/.ssh
sudo usermod --shell /bin/bash jenkins