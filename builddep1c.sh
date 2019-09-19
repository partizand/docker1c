#!/bin/bash

docker build --rm -f ./Dockerfile-dep1c . -t dep1c 
docker system prune -f
