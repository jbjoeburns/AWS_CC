## Setup

Go through the standard launch instance procedure for instances.

However, for security groups, include port 27017 and the SSH one

(Remember, use Ubuntu version 18.04, code ending in 1e9)

Do the standard...
- sudo apt update
- sudo apt upgrade -y

Acquires key to mongodb version we want (3.2)

- wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -

Verifies key

- echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

Update mongoDB

- sudo apt update

Then do this to install components 

- sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20

Edits config file

- sudo nano /etc/mongod.conf
- change line 24 to `bindIp: 0.0.0.0`

Then start mongoDB

- sudo systemctl start mongod
- sudo systemctl enable mongod (makes mongodb start whenever instance is started)

Can check if it's running
- sudo systemctl status mongod

Setting up mongoDB on instance in non-db instance

Make DB_HOST env variable 
- export DB_HOST=mongodb://<public IP for db>:27017/posts

Seed the db, or it will show empty
- node seeds/seed.js

Then launch your app!