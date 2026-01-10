#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e

echo "Stopping old container if running..."
# Using '|| true' ensures the script continues even if the container doesn't exist
sudo docker stop sample-python-app || true
sudo docker rm sample-python-app || true

echo "Pulling latest image..."
# Based on your previous output, the image name is abhishekf5/simple-python-flask-app
sudo docker pull abhishekf5/simple-python-flask-app:latest

echo "Starting new container..."
# -p 80:5000 maps host port 80 to container internal port 5000
sudo docker run -d --name sample-python-app -p 80:5000 abhishekf5/simple-python-flask-app:latest

