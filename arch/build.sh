#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

build_new=$1

if [ "$build_new" = "new" ]; then
    echo reset docker image
    opt="--no-cache"
fi

docker build \
       --build-arg USER_NAME=$USER \
       --build-arg USER_ID=$(id -u) \
       --build-arg GROUP_NAME=$USER \
       --build-arg GROUP_ID=$(id -g) \
       -t arch $opt .
