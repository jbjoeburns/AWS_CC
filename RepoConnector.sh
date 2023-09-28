#!/bin/bash

#Eval
eval `ssh-agent`

#Accepts input
ssh_filepath=`cat ssh_name.txt`

#Adds private key
ssh-add ~/.ssh/$ssh_filepath

