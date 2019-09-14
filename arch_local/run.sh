#!/bin/bash

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo DIR=$DIR

DOCKER_USER=$USER
# lib.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options
source $DIR/../lib.sh

mkdir -p $DIR/container/home
mkdir -p $DIR/container/home/.local
mkdir -p $DIR/container/home/.cache
mkdir -p $DIR/container/home/.config
mkdir -p $DIR/container/home/.local

cp ~/.zshrc $DIR/container/home/.zshrc
cp ~/.sharedrc $DIR/container/home/.sharedrc
cp -R ~/.ssh $DIR/container/home/.ssh

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
                arch_local $@
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
        -v $HOME/Projects:/home/$DOCKER_USER/Projects \
        --workdir=/home/$DOCKER_USER \
        -e HOME=/home/$DOCKER_USER \
        $docker_common_options \
        arch_local $@
fi
