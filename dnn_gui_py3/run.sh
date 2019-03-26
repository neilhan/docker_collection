#!/bin/bash

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DOCKER_USER=dnn_gui_py3

if [ "$(uname)" == "Darwin" ]; then
    echo requires XQuartz, and "Preferences / Allow connections from network clients" enabled.
    # func.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
    source $DIR/../func.sh 
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by func.sh
    set_xhost_ip
    $docker_cmd run --rm -it \
        --name dnn_gui_py3 \
        --net=host \
        -u=$UID:$(id -g $USER) \
        -v $DIR/container/zshrc:/home/$DOCKER_USER/.zshrc \
        -v $HOME/Projects:/home/$DOCKER_USER/Projects \
        $docker_common_options_mac \
        dnn_gui_py3 zsh
else
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # func.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
    source $DIR/../func.sh 
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by func.sh
    $docker_cmd run --rm -it \
        --name dnn_gui_py3 \
        --net=host \
        -u=$UID:$(id -g $USER) \
        -v $DIR/container/zshrc:/home/$DOCKER_USER/.zshrc \
        -v $HOME/Projects:/home/$DOCKER_USER/Projects \
        $docker_common_options \
        dnn_gui_py3 zsh
fi

