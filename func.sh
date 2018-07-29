#!/bin/bash

function test {
    echo "test function."
}

function set_xhost_ip {
    ip=$(ifconfig utun1 | grep inet | awk '$1=="inet" {print $2}')
    if [ -z ip ]; then
        ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
    fi
    xhost + $ip
    export ip=$ip
}

docker_cmd=$(which nvidia-docker)
if [ -f $docker_cmd ]; then
    docker_cmd=$(which docker)
fi
export docker_cmd=$docker_cmd

export docker_common_options_mac="
        -v /tmp/.X11-unix:/tmp/.X11-unix 
        -e DISPLAY=$ip:0 
        --device /dev/dri 
        --device /dev/snd 
        --device /dev/video0 
        --device /dev/input 
        -v $DIR/container/timezone:/etc/timezone 
        -v /etc/hosts:/etc/hosts:ro 
        -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro 
        -v /dev/shm:/dev/shm 
        -u=$UID:$(id -g $USER) 
        --privileged 
        --workdir=$HOME 
	-e HOME=$HOME 
	-v $HOME:$HOME 
        -v $DIR/container:$HOME/.vim 
	-v $DIR/container/vimrc:$HOME/.vimrc 
	-v $DIR/container/gvimrc:$HOME/.gvimrc 
	-v $DIR/container/zshrc:$HOME/.zshrc "

export docker_common_options="
        -v /tmp/.X11-unix:/tmp/.X11-unix 
        -e DISPLAY=unix$DISPLAY 
        --device /dev/dri 
        --device /dev/snd 
        --device /dev/video0 
        --device /dev/input 
        -v /etc/localtime:/etc/localtime:ro 
        -v /etc/hosts:/etc/hosts:ro 
        -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro 
        -v /dev/shm:/dev/shm 
        -u=$UID:$(id -g $USER) 
        --privileged 
        --workdir=$HOME 
	-e HOME=$HOME 
	-v $HOME:$HOME 
        -v $DIR/container:$HOME/.vim 
	-v $DIR/container/vimrc:$HOME/.vimrc 
	-v $DIR/container/gvimrc:$HOME/.gvimrc 
	-v $DIR/container/zshrc:$HOME/.zshrc "

