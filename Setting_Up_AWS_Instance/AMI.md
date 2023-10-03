## AMIs

Amazon machine images. They let you take a snapshot of your instance and files. Saves you from having to scp files and other changes each time you start your instance.

- Go to the control panel for your instance

- Click dropdown

- Then create image

- tech254_joe_app_ami

Creating from AMI, you select "my AMIs" and select yours from the dropdown then do setup as usual.

Can use seperate AMIs for different purposes, for example one AMI root, which is copied twice, with one copy configured for use with python and another with java.

- Set up basics for what you need in the root, then copies make specific for purpose

AMI advantages
- AMI is far faster to launch than using a script.
- AMI ensures the exact same versions for applications, stable
- Can copy AMIs to different regions easy and quick
- As AMIs remain the same, security is easier to enforce
- Autoscaling, as instances can be launched with the same AMI and therefore same configurations

Script advantages
- Script is more flexible as you can edit small lines in script to get different results (eg version of node)
- Script better for automation
- Scripts are free whereas AMI storage costs money
- Can have custom scripts for specific but similar requirements for projects
- Version control is easier for scripts

HOWEVER! Using AMIs and scripts together is ideal! They're not mutually exclusive!

