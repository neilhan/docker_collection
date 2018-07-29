#!/bin/bash

# vim setup
echo maybe setup vim plugins
if [ ! -d ./container/bundle/vundle ]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    git clone https://github.com/gmarik/vundle.git $DIR/container/bundle/vundle
    git clone https://github.com/Valloric/YouCompleteMe $DIR/container/bundle/YouCompleteMe
fi 

docker build --rm -t dnn_gui .
