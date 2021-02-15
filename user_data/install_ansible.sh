#!/bin/bash
sudo apt update -y && sudo apt upgrade -y
sudo apt install ansible -y
sudo apt upgrade ansible -y

echo "Host *" >> /home/ubuntu/.ssh/config
echo "    StrictHostKeyChecking no" >> /home/ubuntu/.ssh/config
chmod 400 /home/ubuntu/.ssh/config
chown ubuntu:ubuntu /home/ubuntu/.ssh/config
