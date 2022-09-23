#!/bin/bash

echo "what is the name of the domain we're installing for?"
echo "should be in format www.website.com"
read website

sudo apt update -y && sudo apt full-upgrade -y
sudo apt install apache2 curl -y
sudo apt install apt-transport-https ca-certificates gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
curl -Lso bitwarden.sh https://go.btwrdn.co/bw-sh && chmod 700 bitwarden.sh
sudo apt update -y
sudo apt install docker-ce docker-compose -y
sudo usermod -aG docker $USER
curl -Lso bitwarden.sh https://go.btwrdn.co/bw-sh && chmod 700 bitwarden.sh
chmod +x bitwarden.sh 
sudo apt install certbot python3-certbot-apache -y
sudo certbot --apache -d $website
sudo systemctl disable apache2
sudo systemctl stop apache2

clear
echo 'starting the actual bitwarden install'
echo 'remember to use website in this form now: website.com'
echo 'yes we want a lets encrypt ssl cert'
echo 'enter to continue.'
read waiting

sudo ./bitwarden.sh install

sudo ./bitwarden.sh start