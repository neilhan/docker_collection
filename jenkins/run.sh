#!/bin/bash

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


if [ "$(uname)" == "Darwin" ]; then
    # lib.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
    source $DIR/../lib.sh 
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by lib.sh
    set_xhost_ip
    $docker_cmd run --rm -it \
        --name jenkins \
        -p 28080:8080 \
        -u root \
        -v $DIR/jenkins-data:/var/jenkins_home \
        -v $DIR/home:/home \
        -v /var/run/docker.sock:/var/run/docker.sock \
        $docker_common_options_mac \
        jenkinsci/blueocean $@

else
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # lib.sh sets varables. Expecting docker_cmd, docker_common_options_mac or docker_common_options 
    source $DIR/../lib.sh 
    # docker_cmd=nvidia-docker, or docker
    # set_xhost_ip is provided by lib.sh
    $docker_cmd run --rm -it \
        --name jenkins \
        -p 28080:8080 \
        -u root \
        -v $DIR/jenkins-data:/var/jenkins_home \
        -v $DIR/home:/home \
        -v /var/run/docker.sock:/var/run/docker.sock \
        $docker_common_options \
        jenkinsci/blueocean $@
fi

#         -v /var/run/docker.sock/var/run/docker.sock \
