#!/bin/bash

source $DIR/func.sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$(uname)" == "Darwin" ]; then
    set_xhost_ip
    docker run --rm -it \
        --name d_vim \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e DISPLAY=$ip:0 \
        --device /dev/dri \
        --device /dev/snd \
        --device /dev/video0 \
        --device /dev/input \
        -v $DIR/timezone:/etc/timezone \
        -v /etc/hosts:/etc/hosts:ro \
        -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro \
        -v /dev/shm:/dev/shm \
        -u=$UID:$(id -g $USER) \
        --privileged \
        --workdir="/home/gui" \
        --volume=$HOME/:/home/gui \
        --volume=$DIR/work_dir:/home/gui/.vim \
        d_vim gvim -f -u /home/gui/.vim/vimrc $@

else
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    docker run --rm -it \
        --name d_vim \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e DISPLAY=unix$DISPLAY \
        --device /dev/dri \
        --device /dev/snd \
        --device /dev/video0 \
        --device /dev/input \
        -v /etc/localtime:/etc/localtime:ro \
        -v /etc/hosts:/etc/hosts:ro \
        -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro \
        -v /dev/shm:/dev/shm \
        -u=$UID:$(id -g $USER) \
        --privileged \
        --workdir="/home/gui" \
        --volume=$HOME/:/home/gui \
        --volume=$DIR/work_dir:/home/gui/.vim \
        d_vim gvim -f -u /home/gui/.vim/vimrc $@
fi
