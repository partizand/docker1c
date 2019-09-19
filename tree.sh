#!/bin/bash

docker run --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz images -t 
