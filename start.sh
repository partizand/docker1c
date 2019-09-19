#!/bin/bash

# docker run -it --rm --entrypoint /bin/sh 1cclient

#docker run --rm -d \
#v /tmp/.X11-unix:/tmp/.X11-unix \
#-e DISPLAY \
#client1c

#docker run -t --rm  -e DISPLAY client1c
# docker run -t --rm  -e DISPLAY -v $HOME/.Xauthority:/home/user/.Xauthority -v $HOME:/home/user -v /mnt:/mnt --net=host --pid=host --ipc=host 1cclient 
#docker run -t --rm  -e DISPLAY:0.0 -v $HOME/.Xauthority:/home/andrey/.Xauthority -v $HOME:/home/andrey -v /mnt:/mnt --net=host --pid=host --ipc=host client1c

#docker run -e DISPLAY=unix$DISPLAY --rm -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/home/user/.Xauthority client1c

# Нужно запустить один раз, что бы xserver разрешил подключаться root из койнтенера к себе
# sudo xhost local:root

# -v $HOME/.Xauthority:/home/user/.Xauthority 
# -v /tmp/.aksusb:/tmp/.aksusb -v /tmp/.X11-unix:/tmp/.X11-unix

# В контейнере 1С запускается под пользователем appuser

docker run -it --rm -e DISPLAY -v $HOME/1s:/home/appuser/1s -v /$HOME/.1C:/home/appuser/.1C -v /tmp/.aksusb:/tmp/.aksusb -v /tmp/.X11-unix:/tmp/.X11-unix client1c
