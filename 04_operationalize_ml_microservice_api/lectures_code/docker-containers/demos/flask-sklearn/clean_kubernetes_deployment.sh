#!/usr/bin/env bash

# This deletes the newly created Kubernetes service and deployment

kubectl delete service udacityflaskdemo
kubectl delete deployment udacityflaskdemo
