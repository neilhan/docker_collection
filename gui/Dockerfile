# FROM ubuntu:rolling
FROM debian:latest
MAINTAINER http://neilhan.ca

# Install the appropriate software
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y bash zsh apt-utils net-tools sudo
RUN apt-get install -y curl wget git jq unzip tmux
RUN apt-get install -y build-essential cmake
RUN apt-get install -y apt-transport-https ca-certificates software-properties-common

# gui support -----------------------
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y locales locales-all
RUN apt-get -y install gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget

# -----------------------------------
# node.js v11, install node.js
# -----------------------------------
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn

# -----------------------------------
# Lumo for clojurescript
# https://github.com/anmonteiro/lumo
# http://lumo-cljs.org/
# -----------------------------------
RUN npm install -g lumo-cljs --unsafe-perm

# -----------------------------------
# clojure script source mapping support
# -----------------------------------
RUN npm install -g source-map-support

# -------------------------------------------------------
# vim neovim
# -------------------------------------------------------
# RUN apt-get install -y wget git build-essential cmake
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim vim-gtk
RUN apt-get install -y xclip xsel ack
# RUN apt-get install -y neovim ctags python python-neovim python3-neovim xclip xsel markdown ack perl python-dev
# # install fzf
# RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# RUN ~/.fzf/install

# -------------------------------------------------------
# emacs, spacemacs
# -------------------------------------------------------
# RUN apt-get install -y xclip xsel ack
RUN apt-get install -y emacs aspell ack silversearcher-ag
RUN npm install -g js-beautify
RUN npm install -g eslint eslint-plugin-jest tern jsonlint standard
# RUN npm install -g jshint

# --------------------------------------
# chrome
# --------------------------------------
RUN apt-get install -y chromium
