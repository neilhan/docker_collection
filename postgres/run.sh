#!/bin/bash

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p $DIR/container/data

DOCKER_USER=postgres

if [ "$(uname)" == "Darwin" ]; then
    # lib.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
    source $DIR/../lib.sh 
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by lib.sh
    set_xhost_ip
    $docker_cmd run --rm -it \
        --name d_postgres \
        -v /tmp:/tmp \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -u=$UID:$(id -g $USER) \
        -v $HOME/.ssh:/home/$DOCKER_USER/.ssh \
        -v $HOME/.zshrc:/home/$DOCKER_USER/.zshrc \
        -v $HOME/.sharedrc:/home/$DOCKER_USER/.sharedrc \
        -v $HOME/.m2:/home/$DOCKER_USER/.m2 \
        -v $HOME/Projects:/home/$DOCKER_USER/Projects \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v $DIR/container/data:/var/lib/postgresql/data \
        -e DISPLAY=docker.for.mac.localhost:0 \
        --device /dev/shm \
        --device /dev/input \
        -v /dev/shm:/dev/shm \
        -v /etc/hosts:/etc/hosts:ro \
        -v /dev/shm:/dev/shm \
        --privileged \
        --workdir=/home/$DOCKER_USER \
        -e LC_ALL=en_CA.UTF-8 \
        -e LANG=en_CA.UTF-8 \
        -e LANGUAGE=en_CA.UTF-8 \
        -e HOME=/home/$DOCKER_USER \
        -v $DIR/container/config:/home/$DOCKER_USER/.config \
        -v $DIR/container/local:/home/$DOCKER_USER/.local \
        -p 5432:5432 \
        d_postgres bash $@

        # -v $DIR/container/timezone:/etc/timezone \
else
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # lib.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
    source $DIR/../lib.sh 
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by lib.sh
    $docker_cmd run --rm -it \
        --name d_postgres \
        --net=host \
        -v /tmp:/tmp \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -u=$UID:$(id -g $USER) \
        -v $HOME/.ssh:/home/$DOCKER_USER/.ssh \
        -v $HOME/.zshrc:/home/$DOCKER_USER/.zshrc \
        -v $HOME/.sharedrc:/home/$DOCKER_USER/.sharedrc \
        -v $HOME/.m2:/home/$DOCKER_USER/.m2 \
        -v $HOME/Projects:/home/$DOCKER_USER/Projects \
        -v $DIR/container/data:/var/lib/postgresql/data \
        --workdir=/home/$DOCKER_USER \
        -p 5432:5432 \
        $docker_common_options \
        d_postgres bash $@
fi

