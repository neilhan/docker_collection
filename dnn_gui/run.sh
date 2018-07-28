#!/bin/bash

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker_cmd=nvidia-docker

source $DIR/../func.sh 

if [ "$(uname)" == "Darwin" ]; then
    echo requires XQuartz, and "Preferences / Allow connections from network clients" enabled.
    set_xhost_ip
    $docker_cmd run --rm -it \
        --name dnn_gui \
	--net=host \
        $docker_common_options_mac \
        dnn_gui zsh
else
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    $docker_cmd run --rm -it \
        --name dnn_gui \
	--net=host \
        $docker_common_options \
        dnn_gui zsh
fi

