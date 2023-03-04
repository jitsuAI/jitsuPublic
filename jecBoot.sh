#!/bin/bash
sudo yum update
sudo yum install docker -y
newgrp docker

sudo yum install python3-pip -y
sudo pip3 install docker-compose

sudo systemctl enable docker.service
sudo systemctl start docker.service

