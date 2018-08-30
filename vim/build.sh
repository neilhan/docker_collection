#!/bin/bash

# vim setup
echo maybe setup vim plugins
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ ! -d $DIR/container/bundle/vundle ]; then
    git clone https://github.com/gmarik/vundle.git $DIR/container/bundle/vundle
    git clone https://github.com/Valloric/YouCompleteMe $DIR/container/bundle/YouCompleteMe
fi

build_new=$1

if [ "$build_new" = "new" ]; then
    echo reset docker image
    opt="--no-cache"
fi

docker build --rm -t d_vim $opt .
