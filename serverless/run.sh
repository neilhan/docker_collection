#!/bin/bash

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DOCKER_USER=sls

mkdir -p $DIR/container/home

# lib.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
source $DIR/../lib.sh 

if [ "$(uname)" == "Darwin" ]; then
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by lib.sh
    set_xhost_ip
    $docker_cmd run --rm -it \
        --name d_sls \
        -v /tmp:/tmp \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -u=$UID:$(id -g $USER) \
        -v $DIR/container/home:/home/$DOCKER_USER \
        -v $HOME/.ssh:/home/$DOCKER_USER/.ssh \
        -v $HOME/.zshrc:/home/$DOCKER_USER/.zshrc \
        -v $HOME/.sharedrc:/home/$DOCKER_USER/.sharedrc \
        -v $HOME/.m2:/home/$DOCKER_USER/.m2 \
        -v $HOME/Projects:/home/$DOCKER_USER/Projects \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e DISPLAY=docker.for.mac.localhost:0 \
        --device /dev/shm \
        --device /dev/input \
        -v /dev/shm:/dev/shm \
        -v $DIR/container/timezone:/etc/timezone \
        -v /etc/hosts:/etc/hosts:ro \
        -v /dev/shm:/dev/shm \
        --privileged \
        -v $DIR/container/local:/home/$DOCKER_USER/.local \
        -v $HOME/Projects:/home/$DOCKER_USER/Projects \
        -v $DIR/container/npm:/home/$DOCKER_USER/.npm \
        -v $DIR/container/config:/home/$DOCKER_USER/.config \
        --workdir=/home/$DOCKER_USER \
        -e HOME=/home/$DOCKER_USER \
        d_serverless $@

else
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by lib.sh
    $docker_cmd run --rm -it \
        --name d_sls \
        --net=host \
        -v /tmp:/tmp \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -u=$UID:$(id -g $USER) \
        -v $DIR/container/home:/home/$DOCKER_USER \
        -v $HOME/.ssh:/home/$DOCKER_USER/.ssh \
        -v $HOME/.zshrc:/home/$DOCKER_USER/.zshrc \
        -v $HOME/.sharedrc:/home/$DOCKER_USER/.sharedrc \
        -v $HOME/.m2:/home/$DOCKER_USER/.m2 \
        -v $HOME/Projects:/home/$DOCKER_USER/Projects \
        --workdir=/home/$DOCKER_USER \
        -e HOME=/home/$DOCKER_USER \
        $docker_common_options \
        d_serverless $@
fi

