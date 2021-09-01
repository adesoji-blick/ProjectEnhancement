#!/bin/bash

# Installing Java OpenJDK11

echo installing GIT
sudo yum install git -y
echo installing Java OpenJDK 11
curl https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_linux-x64_bin.tar.gz -O
tar xvf openjdk-11*_bin.tar.gz
sudo yum install java -y