#!/bin/bash

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DOCKER_USER=vim

touch $DIR/container/viminfo; chmod a+x $DIR/container/viminfo

if [ "$(uname)" == "Darwin" ]; then
    # func.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
    source $DIR/../func.sh 
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by func.sh
    set_xhost_ip
    $docker_cmd run --rm -it \
        --name d_vim \
        -u=$UID:$(id -g $USER) \
        -v $HOME/Projects:/home/$DOCKER_USER/Projects \
        -v $DIR/container/vim:/home/$DOCKER_USER/.vim \
        -v $DIR/container/vim:/home/$USER/.vim \
        -v $DIR/container/vimrc:/home/$DOCKER_USER/.vimrc \
        -v $DIR/container/vimrc:/home/$USER/.vimrc \
        -v $DIR/container/zshrc:/home/$DOCKER_USER/.zshrc \
        -v $DIR/container/local:/home/$DOCKER_USER/.local \
        -v $DIR/container/local:/home/$USER/.local \
        -v $DIR/container/cache:/home/$DOCKER_USER/.cache \
        -v $DIR/container/cache:/home/$USER/.cache \
        -v $DIR/container/home:/home/$DOCKER_USER/ \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e DISPLAY=docker.for.mac.localhost:0 \
        --device /dev/shm \
        --device /dev/input \
        -v /dev/shm:/dev/shm \
        -v $DIR/container/timezone:/etc/timezone \
        -v /etc/hosts:/etc/hosts:ro \
        -v /dev/shm:/dev/shm \
        --privileged \
        -e LC_ALL=en_CA.UTF-8 \
        -e LANG=en_CA.UTF-8 \
        -e LANGUAGE=en_CA.UTF-8 \
        -e HOME=/home/$DOCKER_USER \
        --workdir=/home/$DOCKER_USER \
        d_vim nvim -u /home/$DOCKER_USER/.vimrc $@

else
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # func.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
    source $DIR/../func.sh 
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by func.sh
    $docker_cmd run --rm -it \
        --name d_vim \
        -u=$UID:$(id -g $USER) \
        -v $HOME:/home/$DOCKER_USER \
        -v $HOME:/home/$USER \
        -v $DIR/container/vim:/home/$DOCKER_USER/.vim \
        -v $DIR/container/vimrc:/home/$DOCKER_USER/.vimrc \
        -v $DIR/container/viminfo:/home/$DOCKER_USER/.viminfo \
        -v $DIR/container/viminfo:/home/$USER/.viminfo \
        -v $DIR/container/zshrc:/home/$DOCKER_USER/.zshrc \
        -v $DIR/container/local:/home/$DOCKER_USER/.local \
        -v $DIR/container/local:/home/$USER/.local \
        $docker_common_options \
        d_vim nvim $@
fi
