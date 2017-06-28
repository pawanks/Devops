#!/bin/bash 
ssh-keyscan `cat /etc/hosts|grep bs.local|awk '{print $NF}'|sed '/^$/d'|tr "\n" " "` > .ssh/known_hosts
yum install epel-release -y
yum install ansible -y 
yum install libselinux-python -y
cp -pvr /vagrant/ansible /etc/
chown -R vagrant.vagrant /etc/ansible
chown -R vagrant.vagrant /home/vagrant
#ansible-playbook /etc/ansible/addSSHKey.yml --user=vagrant --extra-vars "ansible_sudo_pass=#{secret['password']}"
ansible-playbook /etc/ansible/addSSHKey.yml --extra-vars @/etc/ansible/secret --vault-password-file=/etc/ansible/vault.txt -e "ansible_ssh_user=vagrant ansible_ssh_pass={{my_pass}}"
#key=`cat /home/vagrant/.ssh/id_rsa.pub`
#echo $access_token
#curl -v -d '{"key":"'"$key"'","title":"vagrant"}' "https://api.github.com/user/keys?access_token=$access_token"

