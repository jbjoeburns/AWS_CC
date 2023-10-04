### Reverse proxies

The nginx reverse proxy works in the following way:

- Server receives HTTP request
- Request inspected
- Depending on the request, user gets a response from backend with specific port

Functionally, this allows us to change default port. So, we could make the default response to HTTP requests be to forward the user to port 3000, displaying our app by default when a user connects to the site.

![1.png](../Deploying_Node/1.png)

Can also have the reverse proxy navigate through firewalls for security.

First, install nginx...
```
# Update
sudo apt-get update -y

# Upgrade
sudo apt-get upgrade -y

# Install nginx
sudo apt-get install nginx -y
```

Then, we need to add a proxy pass setting. 
```
# Open the 'default' config file using nano
sudo nano /etc/nginx/sites-available/default
```

Then set it up so by default this redirects to app.
```
# This should work, can put something different like /homepage too but in this case we leave it blank
location / {
  proxy_pass http://<IP>/;
}
```

You *CAN* also set up headers, but these have default values they'll go to if none are set.
``` 
# Headers are set under the proxy pass setting
location / {
  proxy_pass http://<IP>/;
  proxy_buffering off;
  proxy_set_header X-Real-IP $remote_addr;
  proxy_set_header X-Forwarded-Host $host;
  proxy_set_header X-Forwarded-Port $server_port;
}
```

Finally, need to restart and enable nginx!
``` 
sudo systemctl restart nginx
sudo systemctl enable nginx
```