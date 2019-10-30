#!/bin/bash

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo 'if "docker ps" show that you do not access to the docker.sock, please grant rw permission.'

DOCKER_USER=asw_sam

if [ "$(uname)" == "Darwin" ]; then
    # lib.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
    source $DIR/../lib.sh 
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by lib.sh
    set_xhost_ip
    $docker_cmd run --rm -it \
        --name d_aws_sam \
        -v /tmp:/tmp \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -u=$UID:$(id -g $USER) \
        -v $HOME/.ssh:/home/$DOCKER_USER/.ssh \
        -v $HOME/.zshrc:/home/$DOCKER_USER/.zshrc \
        -v $HOME/.sharedrc:/home/$DOCKER_USER/.sharedrc \
        -v $HOME/.m2:/home/$DOCKER_USER/.m2 \
        -v $HOME/Projects:/home/$DOCKER_USER/Projects \
        -v $HOME:/Users/$USER \
        $docker_common_options_mac \
        d_aws_sam $@

else
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # lib.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
    source $DIR/../lib.sh 
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by lib.sh
    $docker_cmd run --rm -it \
        --name d_aws_sam \
        --net=host \
        -v /tmp:/tmp \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -u=$UID:$(id -g $USER) \
        -v $HOME/.ssh:/home/$DOCKER_USER/.ssh \
        -v $HOME/.zshrc:/home/$DOCKER_USER/.zshrc \
        -v $HOME/.sharedrc:/home/$DOCKER_USER/.sharedrc \
        -v $HOME/.m2:/home/$DOCKER_USER/.m2 \
        -v $HOME/Projects:/home/$DOCKER_USER/Projects \
        -v $HOME:/home/$USER \
        $docker_common_options \
        d_aws_sam $@
fi

