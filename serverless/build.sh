#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

build_new=$1

if [ "$build_new" = "new" ]; then
    echo reset docker image
    opt="--no-cache"
fi

docker build --build-arg host_uid=$(id -u) --build-arg host_gid=$(id -g) -t d_serverless $opt .
