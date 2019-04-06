#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR
mkdir -p container/home/bin
cd $DIR/container/home/
wget -c https://download.jetbrains.com/webstorm/WebStorm-2019.1.tar.gz

tar -xvf WebStorm-2019.1.tar.gz

cd $DIR
