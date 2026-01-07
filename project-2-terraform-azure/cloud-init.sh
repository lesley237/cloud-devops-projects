#!/bin/bash

# Update system
apt-get update -y

# Install Docker
apt-get install -y docker.io

# Start & enable Docker
systemctl start docker
systemctl enable docker

# Add user to docker group
usermod -aG docker azureuser

# Run NGINX container
docker run -d -p 80:80 --name nginx nginx
