#!/bin/bash
if [ "$EUID" -ne 0 ];
  then echo "run as root."
  exit
fi
rm -rf /root/.ssh/authorized_keys
cp /home/ubuntu/.ssh/authorized_keys /root/.ssh/authorized_keys
echo "PermitRootLogin prohibit-password" >> "/etc/ssh/sshd_config"
systemctl restart ssh
