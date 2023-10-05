## Launch scripts on startup
Go into advanced options and type commands in user data.

Can also upload files here.

Formatted as batch scripts, so for example...
```
#!/bin/bash

cd /home/ubuntu/app/app
sudo systemctl restart nginx
npm install
pm2 start app.js
```

As it logs us in as root by default, we start out in the root directory rather than home (~). Need to factor that in when using cd or other commands that require paths.