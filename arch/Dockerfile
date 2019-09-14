FROM archlinux/base

# RUN pacman -Syu --noconfirm

RUN pacman -Sy --noconfirm chromium
RUN pacman -Sy --noconfirm coreutils tar less findutils diffutils grep sed gawk util-linux procps-ng
RUN pacman -Sy --noconfirm git zsh sudo curl wget tmux unzip base-devel
RUN pacman -Sy --noconfirm adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts
RUN pacman -Sy --noconfirm vim emacs aspell ack # silversearch-ag is installed after creating user
RUN pacman -Sy --noconfirm nodejs npm
RUN npm install -g yarn
RUN npm install -g js-beautify
RUN npm install -g eslint eslint-plugin-jest tern jsonlint standard

# -----------------------------------
# Lumo for clojurescript
# -----------------------------------
RUN npm install -g lumo-cljs --unsafe-perm
# clojurescript source mapping support
RUN npm install -g source-map-support

# -------------------------------------------------------
# VS code install
# -------------------------------------------------------
RUN pacman -Sy --noconfirm code

# -------------------------------------------------------
# docker
# -------------------------------------------------------
# RUN pacman -Sy --noconfirm docker

# -------------------------------------------------------
# create user
# -------------------------------------------------------
ARG host_uid=1000
ARG host_gid=1000
ARG user=appuser
RUN groupadd -g $host_gid -o $user &&\
    useradd --uid $host_uid --gid $host_gid -G wheel,$user -m -o -s /bin/zsh $user &&\
    echo "$user:$user" | chpasswd &&\
    echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
# RUN echo "$user ALL=(ALL) ALL" >> /etc/sudoers
# --------------------------------------------------------
# for mac home directory
RUN ln -s /home /Users
# git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

USER appuser
WORKDIR /home/appuser
RUN git clone https://aur.archlinux.org/yay.git && \
  cd yay && \
  echo $user | makepkg -si --noconfirm

# install ag for emacs search
RUN yay -Syu the_silver_searcher --noconfirm

# -----------------------------------
# python needed for machine learning
# -----------------------------------
RUN yay -Sy --noconfirm python python-pip python-virtualenv python-opengl tensorflow
  # python-dev python-tk
USER root
RUN pip3 install --upgrade pip
RUN pip3 install pudb numpy matplotlib
RUN pip3 install gym
RUN pip3 install gym[atari]
