#!/bin/bash

if [ "$EUID" -ne 0 ];
  then echo "Please use sudo to run this install script"
  exit
fi

# copy keys

echo "Coping keys"

rm -rf /root/.ssh/authorized_keys
cp /home/ubuntu/.ssh/authorized_keys /root/.ssh/authorized_keys

echo "Copied keys"


# permit root login

echo "Enabling root login"

line="PermitRootLogin prohibit-password"
file="/etc/ssh/sshd_config"

echo $line >> $file

echo "Enabled root login"
echo "Restarting ssh"

systemctl restart ssh


echo "Done."
