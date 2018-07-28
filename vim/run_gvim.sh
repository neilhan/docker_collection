#!/bin/bash 

docker_cmd=docker

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/../func.sh 

if [ "$(uname)" == "Darwin" ]; then
    echo requires XQuartz, and "Preferences / Allow connections from network clients" enabled.
    set_xhost_ip
    $docker_cmd run --rm -it \
        --name d_vim \
        $docker_common_options_mac \
        d_vim gvim -f $@  &>/dev/null
else
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    $docker_cmd run --rm -it \
        --name d_vim \
        $docker_common_options \
        d_vim gvim -f $@ &>/dev/null
fi
