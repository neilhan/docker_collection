#!/bin/bash

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# func.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
source $DIR/../func.sh 
# docker_cmd=nvidia-docker, or docker
# set_xhost_ip is provided by func.sh

if [ "$(uname)" == "Darwin" ]; then
    set_xhost_ip
    $docker_cmd run --rm -it \
        --name d_vim \
        $docker_common_options_mac \
        d_vim vim $@

else
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    $docker_cmd run --rm -it \
        --name d_vim \
        $docker_common_options \
        d_vim vim $@
fi
