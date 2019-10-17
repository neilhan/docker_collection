#!/bin/bash

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p $DIR/data_db

docker run --rm -it \
            --name d_mongo \
            -v $DIR/data_db:/data/db \
            --privileged \
            -p 27017:27017 \
            mongo $@
