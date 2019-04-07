#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR
mkdir -p container/home/bin
mkdir -p container/home/Projects
git clone https://github.com/syl20bnr/spacemacs container/home/.emacs.d
cd $DIR/container/home/

cd $DIR
