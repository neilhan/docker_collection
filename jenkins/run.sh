#!/bin/bash

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


if [ "$(uname)" == "Darwin" ]; then
    # func.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
    source $DIR/../func.sh 
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by func.sh
    set_xhost_ip
    $docker_cmd run --rm -it \
        --name jenkins \
        -p 28080:8080 \
        -u root \
        -v $DIR/jenkins-data:/var/jenkins_home \
        -v $DIR/home:/home \
        $docker_common_options_mac \
        jenkinsci/blueocean $@

else
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # func.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
    source $DIR/../func.sh 
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by func.sh
    $docker_cmd run --rm -it \
        --name jenkins \
        -p 28080:8080 \
        -u root \
        -v $DIR/jenkins-data:/var/jenkins_home \
        -v $DIR/home:/home \
        $docker_common_options \
        jenkinsci/blueocean $@
fi

#         -v /var/run/docker.sock/var/run/docker.sock \
