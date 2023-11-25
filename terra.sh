#!/bin/bash
##################################
# Author : Srikanth
# created date: 26.11.2023
# Version: 1.0
# Team : DevOps
#####################################
echo " yum-config-manager"
sudo yum install -y yum-utils
echo "yum-config-manager- to add the official HashiCorp Linux repository"
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
echo "Install Terraform from the new repository"
sudo yum -y install terraform
echo "terraform version"
sudo terraform -version"
##echo "download the awscli"
##curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
##echo "unzip awscli"
##unzip awscliv2.zip
##echo "chmod permission awscli file"
##sudo chmod 755 aws/install 
##echo "aws install"
##sudo ./aws/install
