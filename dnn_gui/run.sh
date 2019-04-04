#!/bin/bash

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DOCKER_USER=dnn_gui

if [ "$(uname)" == "Darwin" ]; then
    echo requires XQuartz, and "Preferences / Allow connections from network clients" enabled.
    # lib.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
    source $DIR/../lib.sh 
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by lib.sh
    set_xhost_ip
    $docker_cmd run --rm -it \
        --name dnn_gui \
        --net=host \
        -u=$UID:$(id -g $USER) \
        -v $DIR/container:/home/$DOCKER_USER/.vim \
        -v $DIR/container/vimrc:/home/$DOCKER_USER/.vimrc \
        -v $DIR/container/gvimrc:/home/$DOCKER_USER/.gvimrc \
        -v $DIR/container/zshrc:/home/$DOCKER_USER/.zshrc \
        $docker_common_options_mac \
        dnn_gui zsh
else
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # lib.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
    source $DIR/../lib.sh 
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by lib.sh
    $docker_cmd run --rm -it \
        --name dnn_gui \
        --net=host \
        -u=$UID:$(id -g $USER) \
        -v $DIR/container:/home/$DOCKER_USER/.vim \
        -v $DIR/container/vimrc:/home/$DOCKER_USER/.vimrc \
        -v $DIR/container/gvimrc:/home/$DOCKER_USER/.gvimrc \
        -v $DIR/container/zshrc:/home/$DOCKER_USER/.zshrc \
        $docker_common_options \
        dnn_gui zsh
fi

