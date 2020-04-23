#!/usr/bin/env bash

# Build image
docker build --tag=flask-hello-world .

# Run flask app
docker run --rm -p 8000:5001 flask-hello-world
