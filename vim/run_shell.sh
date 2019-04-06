#!/bin/bash

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DOCKER_USER=vim
# lib.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
source $DIR/../lib.sh 

mkdir -p $DIR/container/vim
mkdir -p $DIR/container/config/nvim/
touch $DIR/container/viminfo; chmod a+x $DIR/container/viminfo

if [ "$(uname)" == "Darwin" ]; then
    # lib.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by lib.sh
    set_xhost_ip
    $docker_cmd run --rm -it \
        --name d_vim \
        -u=$UID:$(id -g $USER) \
        -v $DIR/container/home:/home/$DOCKER_USER/ \
        -v $HOME/Projects:/home/$DOCKER_USER/Projects \
        -v $DIR/container/zshrc:/home/$DOCKER_USER/.zshrc \
        -v $DIR/container/zshrc:/home/$USER/.zshrc \
        -v $DIR/container/config:/home/$DOCKER_USER/.config \
        -v $DIR/container/config:/home/$USER/.config \
        -v $DIR/container/vim:/home/$DOCKER_USER/.vim \
        -v $DIR/container/vim:/home/$USER/.vim \
        -v $DIR/container/vimrc:/home/$DOCKER_USER/.vimrc \
        -v $DIR/container/vimrc:/home/$USER/.vimrc \
        -v $DIR/container/local:/home/$DOCKER_USER/.local \
        -v $DIR/container/local:/home/$USER/.local \
        -v $DIR/container/cache:/home/$DOCKER_USER/.cache \
        -v $DIR/container/cache:/home/$USER/.cache \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e DISPLAY=docker.for.mac.localhost:0 \
        --device /dev/input \
        -v $DIR/container/timezone:/etc/timezone \
        -v /etc/hosts:/etc/hosts:ro \
        --privileged \
        -e LC_ALL=C.UTF-8 \
        -e LANG=C.UTF-8 \
        -e LANGUAGE=C.UTF-8 \
        -e HOME=/home/$DOCKER_USER \
	--workdir=/home/$DOCKER_USER \
        d_vim zsh $@
        # d_vim nvim -u /home/$DOCKER_USER/.vimrc $@

else
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by lib.sh
    $docker_cmd run --rm -it \
        --name d_vim \
        -u=$UID:$(id -g $USER) \
        -v $HOME:/home/$DOCKER_USER \
        -v $HOME:/home/$USER \
        -v $DIR/container/zshrc:/home/$DOCKER_USER/.zshrc \
        -v $DIR/container/vim:/home/$DOCKER_USER/.vim \
        -v $DIR/container/vim:/home/$USER/.vim \
        -v $DIR/container/vimrc:/home/$DOCKER_USER/.vimrc \
        -v $DIR/container/vimrc:/home/$USER/.vimrc \
        -v $DIR/container/viminfo:/home/$DOCKER_USER/.viminfo \
        -v $DIR/container/viminfo:/home/$USER/.viminfo \
        -v $DIR/container/local:/home/$DOCKER_USER/.local \
        -v $DIR/container/local:/home/$USER/.local \
        -v $DIR/container/cache:/home/$DOCKER_USER/.cache \
        -v $DIR/container/cache:/home/$USER/.cache \
	--workdir=/home/$DOCKER_USER \
        $docker_common_options \
        d_vim zsh $@
fi
