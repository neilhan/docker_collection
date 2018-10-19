#!/bin/bash

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


if [ "$(uname)" == "Darwin" ]; then
    # func.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
    source $DIR/../func.sh 
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by func.sh
    set_xhost_ip
    $docker_cmd run --rm -it \
        --name d_sshx \
        -u=$UID:$(id -g $USER) \
        -v $HOME/.ssh:/home/gui/.ssh \
        -v $HOME/.zshrc:/home/gui/.zshrc \
        -v $HOME/.sharedrc:/home/gui/.sharedrc \
        -v $HOME/.m2:/home/gui/.m2 \
        -v $HOME/Projects:/home/gui/Projects \
        $docker_common_options_mac \
        d_sshx $@

else
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # func.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
    source $DIR/../func.sh 
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by func.sh
    $docker_cmd run --rm -it \
        --name d_sshx \
        -u=$UID:$(id -g $USER) \
        -v $HOME/.ssh:/home/gui/.ssh \
        -v $HOME/.zshrc:/home/gui/.zshrc \
        -v $HOME/.sharedrc:/home/gui/.sharedrc \
        -v $HOME/.m2:/home/gui/.m2 \
        -v $HOME/Projects:/home/gui/Projects \
        $docker_common_options \
        d_sshx $@
fi
