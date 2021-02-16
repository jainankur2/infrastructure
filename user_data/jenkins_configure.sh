#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y openjdk-8-jdk
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \/etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y
sudo apt-get install jenkins -y

sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update -y
apt-cache policy docker-ce
sudo apt install docker-ce -y

sudo apt install maven -y

sudo usermod -a -G docker jenkins

sudo chmod 666 /var/run/docker.sock

mkdir /var/lib/jenkins/.ssh
touch /var/lib/jenkins/.ssh/config
echo "Host *" >> /var/lib/jenkins/.ssh/config
echo "    StrictHostKeyChecking no" >> /var/lib/jenkins/.ssh/config
chmod 400 /var/lib/jenkins/.ssh/config
chown -R jenkins:jenkins /var/lib/jenkins/.ssh
