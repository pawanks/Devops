#!/bin/bash 
sudo  yum install epel-release -y
sudo yum update -y 
sudo yum install ansible -y
cp -pvr /vagrant/ansible/* /etc/ansible/
