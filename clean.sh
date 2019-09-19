#!/bin/bash

# delete sttoped containers
docker rm $(docker ps -a -f status=exited -q) 

# delete all images 
docker rmi $(docker images -a -q)

# remove only untagget images
#docker rmi $(docker images -a|grep "<none>"|awk '$1=="<none>" {print $3}')


docker system prune -f
