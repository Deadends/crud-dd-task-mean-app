#!/bin/bash

# MEAN Stack Deployment Script

echo "Starting MEAN Stack deployment..."

# Update system
sudo apt update && sudo apt upgrade -y

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Create application directory
sudo mkdir -p /opt/mean-app
cd /opt/mean-app

# Clone repository
git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git .

# Set environment variables
export DOCKER_USERNAME=your_docker_username

# Start services
docker-compose -f docker-compose.prod.yml up -d

echo "Deployment completed! Application is running on port 80"