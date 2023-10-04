#!/bin/bash

# this removes nginx if it's already installed, this is useful for resetting the default file, include at own caution
# sudo apt purge nginx -y

# update and upgrade packages BEFORE installing node
sudo apt update
sudo apt upgrade -y

# install nginx
sudo apt install nginx -y

# will replace line 51 ('try_files $uri $uri/ =404;', which prevents images from loading) with 'proxy_pass http://<IP>:3000/;' which makes the landing page of the site redirect to port 3000
sudo sed '51s|try_files $uri $uri/ =404;|proxy_pass http://<IP>:3000/;|' /etc/nginx/sites-available/default
# if this doesnt work (if not a fresh nginx install), then change this like to
# sed '51s|\(.*\)|proxy_pass http://<IP>:3000/;|' /etc/nginx/sites-available/default
# this replaces any content on line 51 with the proxy pass
# or use
# sudo nano /etc/nginx/sites-available/default and change it manually

#restart/start nginx then enable it, important to do this after each change to default file
sudo systemctl restart nginx
sudo systemctl enable nginx

# node js 12.x installed
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# node package manager and node process manager installed
sudo npm install pm2 -g
npm install

# start app
node app.js