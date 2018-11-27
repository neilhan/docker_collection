#!/bin/bash

function test {
    echo "test function."
}

function set_xhost_ip {
    # ip=$(ifconfig utun1 | grep inet | awk '$1=="inet" {print $2}')
    # if [ -z ip ]; then
    #     ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
    # fi
    # xhost + $ip
    xhost + 127.0.0.1
    # export ip=$ip
}

docker_cmd=$(which nvidia-docker)
if [ -f $docker_cmd ]; then
    docker_cmd=$(which docker)
fi
export docker_cmd=$docker_cmd

export docker_common_options_mac="
        -v /tmp/.X11-unix:/tmp/.X11-unix 
        -e DISPLAY=docker.for.mac.localhost:0 
        --device /dev/dri 
        --device /dev/snd 
        --device /dev/shm 
        --device /dev/video0 
        --device /dev/input 
        -v /dev/dri:/dev/dri 
        -v /dev/snd:/dev/snd 
        -v /dev/shm:/dev/shm 
        -v /dev/video0:/dev/video0 
        -v $DIR/container/timezone:/etc/timezone 
        -v /etc/hosts:/etc/hosts:ro 
        -v /dev/shm:/dev/shm 
        --privileged 
        -e LC_ALL=en_CA.UTF-8
        -e LANG=en_CA.UTF-8
        -e LANGUAGE=en_CA.UTF-8
        --workdir=$HOME 
	-e HOME=$HOME 
	-v $HOME:$HOME"
# -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro 

export docker_common_options="
        -v /tmp/.X11-unix:/tmp/.X11-unix 
        -e DISPLAY=unix$DISPLAY 
        --device /dev/dri 
        --device /dev/snd 
        --device /dev/shm 
        --device /dev/video0 
        --device /dev/input 
        -v /dev/dri:/dev/dri 
        -v /dev/snd:/dev/snd 
        -v /dev/shm:/dev/shm 
        -v /dev/video0:/dev/video0 
        -v /etc/localtime:/etc/localtime:ro 
        -v /etc/hosts:/etc/hosts:ro 
        -v /dev/shm:/dev/shm 
        --privileged 
        -e LC_ALL=en_CA.UTF-8
        -e LANG=en_CA.UTF-8
        -e LANGUAGE=en_CA.UTF-8
        --workdir=$HOME 
	-e HOME=$HOME 
	-v $HOME:$HOME"
# -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro 
        # -v $DIR/container/etc_default_locale:/etc/default/locale 
