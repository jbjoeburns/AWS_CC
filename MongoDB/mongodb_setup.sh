#!/bin/bash

# update/upgrade
sudo apt update
sudo apt upgrade -y

# acquire key to mongodb version we want (3.2).
wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -

# verify the key.
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# update our app list again
sudo apt update

# install mongodb
sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20
sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20

# edit the config to define what IP we want to be able to connect to the database.
sudo sed '24s|bindIp: 127.0.0.1/bindIp: 0.0.0.0|' /etc/mongod.conf

# start mongoDB.
sudo systemctl start mongod
sudo systemctl enable mongod

# check its working
sudo systemctl status mongod