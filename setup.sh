#!/bin/bash

# install ansible
apt-get --assume-yes update
apt-get --assume-yes install software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get --assume-yes update
apt-get --assume-yes install ansible

# run playbook
cd ansible && ansible-playbook -i inventory/dev site.yml --ask-pass --ask-become-pass

