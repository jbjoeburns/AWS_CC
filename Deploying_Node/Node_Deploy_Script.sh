#!/bin/bash

# update and upgrade packages BEFORE installing node
sudo apt update
sudo apt upgrade -y

#install nginx
sudo apt install nginx -y

# node js 12.x installed
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# node package manager and node process manager installed
sudo npm install pm2 -g
npm install

#restart/start nginx
sudo systemctl restart nginx

#enable nginx
sudo systemctl enable nginx

# start app
node app.js