#!/bin/bash

# vim setup
echo maybe setup vim plugins
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

build_new=$1

if [ "$build_new" = "new" ]; then
    echo reset docker image
    opt="--no-cache"
fi

nvidia-docker build $opt --rm -t dnn_gui_py3 .
