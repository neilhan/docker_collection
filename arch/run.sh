#!/bin/bash

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo DIR=$DIR

DOCKER_USER=$USER
# lib.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options
source $DIR/../lib.sh

mkdir -p $DIR/container/home
mkdir -p $DIR/container/local
mkdir -p $DIR/container/cache


if [ "$(uname)" == "Darwin" ]; then
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by lib.sh
    set_xhost_ip
    $docker_cmd run --rm -it \
        --name arch \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e DISPLAY=docker.for.mac.host.internal:0 \
        --device /dev/shm \
        --device /dev/input \
        -v /dev/shm:/dev/shm \
        --privileged \
        arch $@

else
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by lib.sh
    $docker_cmd run --rm -it \
        --name dev \
        --net=host \
        -v /tmp:/tmp \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -u=$UID:$(id -g $USER) \
        -v $DIR/container/home:/home/$DOCKER_USER \
        -v $DIR/container/config:/home/$DOCKER_USER/.config \
        -v $DIR/container/local:/home/$DOCKER_USER/.local \
        -v $DIR/container/cache:/home/$DOCKER_USER/.cache \
        -v $DIR/container/zshrc:/home/$DOCKER_USER/.zshrc \
        -v $HOME/.ssh:/home/$DOCKER_USER/.ssh \
        -v $HOME/Projects:/home/$DOCKER_USER/Projects \
        --workdir=/home/$DOCKER_USER \
        -e HOME=/home/$DOCKER_USER \
        $docker_common_options \
        local $@
fi
