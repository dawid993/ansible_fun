#!/bin/sh

sleep 5
set -eu
set -x

mkdir -p /root/.ssh
cp /work/ssh_config /root/.ssh/config
chmod 600 /root/.ssh/config
ansible -i inventory.ini all -m ping
ansible-playbook -i inventory.ini ansible_apache.yml

sleep infinity
