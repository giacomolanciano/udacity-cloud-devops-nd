#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

#Assumes this is built
# See `run_docker.sh`

# Step 1:
# Create your on docker ID here
dockerpath="glanciano/udacity-flaskdemo"

# Step 2:
# Authenticate & Tag
echo "Docker ID and Image: $dockerpath"
docker tag udacity-flaskdemo:latest "$dockerpath":latest

# Step 3:
# Push Image
docker push "$dockerpath":latest
