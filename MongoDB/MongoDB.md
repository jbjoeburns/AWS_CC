## Setup for mongoDB

First, go through the standard launch instance procedure for instances (Remember, use **Ubuntu** version **18.04**, code ending in **1e9**).

However, for **security groups**, include port **27017** and the **standard SSH one**.

Once the instance launches, connect and do the following, as usual:
- `sudo apt update`
- `sudo apt upgrade -y`

Next, we need to acquire key to mongodb version we want (3.2).

- `wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -`

Then we verify the key.

- `echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list`

Once we have identified the version we want we update our app list.

- `sudo apt update`

Then do this to install it.

- `sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20`

Finally, we edit the config to define what IP we want to be able to connect to the database.

- `sudo nano /etc/mongod.conf`
- change line 24 to `bindIp: 0.0.0.0`

Then start mongoDB.

- `sudo systemctl start mongod`
- `sudo systemctl enable mongod` (makes mongodb start whenever instance is started)

We can check if it's running using the following.
- `sudo systemctl status mongod`

The database is now running, we only need to connect to it now.

## Connecting other instance to mongoDB instance

First we make DB_HOST an environment variable. This provides node with the IP and port to connect to the database.
- `export DB_HOST=mongodb://<public IP for db>:27017/posts`

Then seed the db, or it will show empty.
- `node seeds/seed.js`

Then launch your app!