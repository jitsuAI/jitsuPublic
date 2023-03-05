#!/bin/bash
sudo yum update -y
sudo yum install docker -y
sudo usermod -a -G docker ec2-user
newgrp docker

# Installing Docker Compose
echo "Installing docker-compose..."
sudo yum install python3-pip -y
sudo pip3 install docker-compose

# Start docker services
echo "Start docker services..."
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo systemctl status docker.service

curl https://raw.githubusercontent.com/jitsuAI/jitsuPublic/main/jec-orchestrator/docker-compose.yml > docker-compose.yml
curl https://raw.githubusercontent.com/jitsuAI/jitsuPublic/main/jec-orchestrator/.env > .env

aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/w1g9s3d2

docker-compose --env-file .env up -d