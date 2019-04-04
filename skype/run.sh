#!/bin/bash

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


if [ "$(uname)" == "Darwin" ]; then
    # lib.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
    source $DIR/../lib.sh 
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by lib.sh
    set_xhost_ip
    $docker_cmd run --rm -d \
        --name d_skype \
        --hostname d_skype \
        -u=$UID:$(id -g $USER) \
        $docker_common_options_mac \
        jess/skype $@

else
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # lib.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
    source $DIR/../lib.sh 
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by lib.sh
    $docker_cmd run --rm -d \
        --name d_skype \
        --hostname d_skype \
        -u=$UID:$(id -g $USER) \
        $docker_common_options \
        jess/skype $@
fi
