#/bin/bash

#We need to start rsyslogd deamon so fail2ban have log file it can read from
docker compose exec node1 rsyslogd
docker compose exec node2 rsyslogd

#We need to avoid ssh not know host message
docker compose exec ansible sh -c "
mkdir -p /root/.ssh
cp /work/ssh_config /root/.ssh/config
chmod 600 /root/.ssh/config
ansible -i inventory.ini all -m ping
ansible-playbook -i inventory.ini ansible_apache.yml
"

