#!/bin/bash

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo DIR=$DIR

git clone https://github.com/syl20bnr/spacemacs $DIR/container/home/.emacs.d
cp ~/.spacemacs $DIR/container/home/.spacemacs
