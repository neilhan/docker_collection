#!/bin/bash

# vim setup
echo maybe setup vim plugins
if [ ! -d ./container/bundle/vundle ]; then
    git clone https://github.com/gmarik/vundle.git ./container/bundle/vundle
    git clone https://github.com/Valloric/YouCompleteMe ./container/bundle/YouCompleteMe
fi

docker build --rm -t d_vim .
