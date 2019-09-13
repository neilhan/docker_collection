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
if [[ -n "$docker_cmd" ]]; then
    echo set docker_cmd to nvidia-docker
    docker_cmd=$(which nvidia-docker)
else
    echo set docker_cmd to docker
    docker_cmd=$(which docker)
fi
export docker_cmd=$docker_cmd
echo docker command: $docker_cmd

export docker_common_options_mac="
        -v /tmp/.X11-unix:/tmp/.X11-unix
        -e DISPLAY=docker.for.mac.host.internal:0
        --device /dev/dri
        --device /dev/snd
        --device /dev/shm
        --device /dev/video0
        --device /dev/input
        -v /dev/dri:/dev/dri
        -v /dev/snd:/dev/snd
        -v /dev/shm:/dev/shm
        -v /dev/video0:/dev/video0
        -v /etc/hosts:/etc/hosts:ro
        --privileged
        -e LC_ALL=C.UTF-8
        -e LANG=C.UTF-8
        -e LANGUAGE=C.UTF-8"
# -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro
# -v $DIR/container/timezone:/etc/timezone

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
        -e LC_ALL=C.UTF-8
        -e LANG=C.UTF-8
        -e LANGUAGE=C.UTF-8"
# -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro
        # -v $DIR/container/etc_default_locale:/etc/default/locale
