#!/bin/bash

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


if [ "$(uname)" == "Darwin" ]; then
    # func.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
    source $DIR/../func.sh 
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by func.sh
    set_xhost_ip
    $docker_cmd run --rm -it \
        --name d_vim \
        -u=$UID:$(id -g $USER) \
        -v $DIR/container:$HOME/.vim \
	-v $DIR/container/vimrc:$HOME/.vimrc \
	-v $DIR/container/gvimrc:$HOME/.gvimrc \
	-v $DIR/container/zshrc:$HOME/.zshrc \
        $docker_common_options_mac \
        d_vim nvim $@

else
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # func.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
    source $DIR/../func.sh 
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by func.sh
    $docker_cmd run --rm -it \
        --name d_vim \
        -u=$UID:$(id -g $USER) \
        -v $DIR/container:$HOME/.vim \
	-v $DIR/container/vimrc:$HOME/.vimrc \
	-v $DIR/container/gvimrc:$HOME/.gvimrc \
	-v $DIR/container/zshrc:$HOME/.zshrc \
        $docker_common_options \
        d_vim nvim $@
fi
