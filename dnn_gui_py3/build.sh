#!/bin/bash

# vim setup
echo maybe setup vim plugins
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ ! -d ./container/bundle/vundle ]; then
    git clone https://github.com/gmarik/vundle.git $DIR/container/bundle/vundle
    git clone https://github.com/Valloric/YouCompleteMe $DIR/container/bundle/YouCompleteMe
fi 

docker build --rm -t dnn_gui_py3 .
