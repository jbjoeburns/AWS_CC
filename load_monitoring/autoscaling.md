## High availability scalability (HA SC)

We can set up a system that automatically sets up more VMs when the CPU load threshold is reached, which is done to avoid exceeding 100% usage and therefore crashes and downtime.

Need to allow VM to make more VMs. This can be done with a **launch template**.
- **Launch template** is the parameters/settings we want for our VM, like when we usually set them up. This can be read by the **auto scaling group**.
- Basically acts like instructions for our auto scaling group to follow when making new instances.

Auto scaling group has parameters it needs to work by
- Max group size
- Min group size
- Desired group size
- Region(s) you want to use and availability zones
- In our case, we will set these as 3, 2 and 2 respectively, in ireland.
- Scaling policy (eg. how much %CPU usage until autoscaling triggers)
- And others...

We also need a load balancer to ensure traffic is distributed evenly among availability zones, to avoid congestion.
- Redirects traffic based on VMs being down and current traffic.
- The VMs created this way are evenly spread across availability zones (1st goes into 1A, then 2nd to 1B, then 1C, then 1A again and so on).

Together, this creates a complex system that allows dynamic creation of VMs in response to traffic and CPU usage, minimising potential downtime.

![3.png](3.png)

## Setting up auto scaling launch template

Go to EC2 then **launch template** (under instances tab).

Create launch template and give it an appropriate name.

Pick usual parameters, and make sure that user data is provided!

eg...
``` 
#!/bin/bash

cd /home/ubuntu/app/app
sudo npm install pm2 -g
sudo systemctl restart nginx
npm install
pm2 kill
pm2 start app.js
```

This is the information the ASG will use to launch new instances.

MAKE SURE TO TEST TEMPLATE AT THIS PHASE!!!

If it doesnt work and you continue, you could waste a lot of time!

To test...
- Click launch instance from template.
- Click add new tag under resource tags.
- Select name and give an appropriate name.
- Can click actions, then launch from template to launch with all of our the preset parameters.

## Setting up ASG

Click on auto scaling groups, at the bottom on the sidebar, and create group.

Give an appropriate name, and provide it with our launch template.

Set availability zones in launch options (in our case, devops student default EU-W 1a, 1b and 1c)

On step 3, we can create the ***load balancer***!

## Setting up load balancer

Then we can create a new load balancer, which needs to be an application load balancer (as we use HTTP)

We want it to be internet facing as we're not connecting via intranet (not intended to be internal network).

Need to go into listeners and routing, then we need to set up new target group as the load balancer needs to know what to route the traffic to.

Then turn on elastic load balancing health checks.

## Continuing setting up ASG

Now we have an attached load balancer, we can continue setting up our ASG.

We need to set up set group size parameters, which is what we want the max, min and desired number of VMs created by the ASG.
- Max = 3
- Min = 2
- Desired = 2

We also need to set up scaling policies
- Click target tracking scaling policy
- Then to track CPU usage to know when to make new instances click average CPU utilisation as metric type
- Then set the threshold before you want a new instance being made, in our case 50%

Can also set up alarms to notify when new instance is made/destroyed

We can also add tags to keep track of instances made by this ASG
- Key will be "Name", as we want to give new instances names, then put the name we want in the value field

Then finally we need to route this through the load balancer
- This just means, when we connect to our instance we do it using the DNS name from the load balancer
- Therefore, we will connect to the LB, which will then allocate us an instance depending on traffic/CPU load per instance