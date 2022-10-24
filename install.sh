#!/bin/bash

# install ansible
if [[ $(ansible --version) ]]; then
  echo "Ansible is already installed."
  echo ""
else
  apt-get --assume-yes update
  apt-get --assume-yes install software-properties-common
  apt-add-repository ppa:ansible/ansible
  apt-get --assume-yes update
  apt-get --assume-yes install ansible
fi

echo "---"

ansible_tags=""
if [[ -z "$1" ]]; then
  ansible_tags="all"
else
  ansible_tags="$1"
fi
echo "Running with tags: $ansible_tags"

echo ""

# run playbook
cd ansible \
  && ansible-playbook -i inventory/dev install.yml \
  --tags "$ansible_tags"


