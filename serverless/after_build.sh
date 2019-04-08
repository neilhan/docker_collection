#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR
mkdir -p container/home/bin
mkdir -p container/home/Projects

# checkout spacemacs
git clone https://github.com/syl20bnr/spacemacs container/home/.emacs.d

cd $DIR/container/home/

# intellij
wget -c https://download.jetbrains.com/idea/ideaIU-2019.1.tar.gz -O idea.tar.gz
tar -xvf idea.tar.gz
mv ./idea-IU-* bin/
cd bin
idea_dir=$(ls -d idea-IU-*)
ln -s $idea_dir idea
 
# # webstorm
# wget -c https://download.jetbrains.com/webstorm/WebStorm-2019.1.tar.gz 
# tar -xvf WebStorm-2019.1.tar.gz 
# mv WebStorm-191.6183.63 bin/
# cd bin
# ln -s WebStorm-191.6183.63 webstorm

cd $DIR
