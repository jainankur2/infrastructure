#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y openjdk-8-jdk
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \/etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y
sudo apt-get install jenkins -y

echo "Host *" >> /var/lib/jenkins/.ssh/config
echo "    StrictHostKeyChecking no" >> /var/lib/jenkins/.ssh/config
chmod 400 /var/lib/jenkins/.ssh/config
chown jenkins:jenkins /var/lib/jenkins/.ssh/config
