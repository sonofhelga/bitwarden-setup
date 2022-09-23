#!/bin/bash

echo "do not run this bad boy as root."
echo "what is your username?"
read name

sudo apt udpate -y && sudo apt full-upgrade
sudo apt install apache2 curl
sudo apt install apt-transport-https ca-certificates gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
sudo apt install docker-ce docker-compose
sudo usermod -aG docker $name
curl -Lso bitwarden.sh https://go.btwrdn.co/bw-sh && chmod 700 bitwarden.sh
chmod +x bitwarden.sh 
sudo apt install certbot python3-certbot-apache
sudo certbot --apache -d www.theitadventure.com
sudo systemctl disable apache2
./bitwarden install