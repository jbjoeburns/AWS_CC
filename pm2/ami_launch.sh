#!/bin/bash

cd /home/ubuntu/app/app
sudo systemctl restart nginx
npm install
pm2 start app.js