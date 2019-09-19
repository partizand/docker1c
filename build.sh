#!/bin/bash
docker build --rm . -t client1c 
docker system prune -f
