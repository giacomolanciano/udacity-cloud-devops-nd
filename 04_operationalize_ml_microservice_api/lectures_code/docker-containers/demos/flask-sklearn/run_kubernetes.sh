#!/usr/bin/env bash

# This runs the container in a Kubernetes pod and makes it accessible from the host

# Step 1:
# This is your Docker ID
dockerpath="glanciano/udacity-flaskdemo"

# Step 2
# Run in Docker Hub container with kubernetes
kubectl run flaskskearlndemo \
    --generator=run-pod/v1 \
    --image=$dockerpath \
    --port=80 --labels app=flaskskearlndemo
# --overrides='{ "apiVersion": "v1", "spec": { "imagePullSecrets": [{"name": "regcred"}] } }'

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to host
kubectl port-forward flaskskearlndemo 8000:80
