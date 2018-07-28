#!/bin/bash

docker_cmd=nvidia-docker

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/../func.sh 

if [ "$(uname)" == "Darwin" ]; then
    set_xhost_ip
    $docker_cmd run --rm -it \
        --name d_vim \
        $docker_common_options_mac \
        d_vim zsh
        # d_vim vim -u /home/gui/.vim/vimrc $@

else
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    $docker_cmd run --rm -it \
        --name d_vim \
        $docker_common_options \
        d_vim zsh
        # d_vim vim -u /home/gui/.vim/vimrc $@
fi
