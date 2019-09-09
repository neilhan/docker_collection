FROM ubuntu:18.04
# FROM debian:stretch-slim
MAINTAINER http://neilhan.ca

# Install the appropriate software
RUN apt-get update && apt-get install -y bash zsh apt-utils net-tools curl wget git jq unzip tmux
# RUN apt-get update && apt-get install -y --fix-missing build-essential cmake
RUN apt-get install -y apt-transport-https ca-certificates software-properties-common
RUN apt-get update && apt-get -y upgrade

# gui support -----------------------
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y locales locales-all
RUN apt-get -y --fix-missing install gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget

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
RUN apt-get install -y chromium-browser

# --------------------------------------
# docker
# RUN apt-get install docker-ce docker-ce-cli containerd.io
RUN apt-get install -y docker.io

# -------------------------------------------------------
# create user
# -------------------------------------------------------
ARG host_uid=1000
ARG host_gid=1000
ARG user=appuser
RUN groupadd -g $host_gid -o $user
# RUN groupadd docker
RUN echo "$user:x:$host_uid:$host_gid::/home/$user:/usr/bin/zsh" >> /etc/passwd
# RUN useradd --uid $host_uid --gid $host_gid -m -o -s /bin/zsh $user
RUN usermod -aG sudo $user
RUN usermod -aG docker $user
RUN echo "$user:$user" | chpasswd
# --------------------------------------------------------
# for mac home directory
RUN ln -s /home /Users
