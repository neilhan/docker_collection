#!/bin/bash

if [ ! -d ./work_dir/bundle/vundle ]; then
    git clone https://github.com/gmarik/vundle.git ./work_dir/bundle/vundle
    git clone https://github.com/Valloric/YouCompleteMe ./work_dir/bundle/YouCompleteMe
fi

docker build --rm -t d_vim .
