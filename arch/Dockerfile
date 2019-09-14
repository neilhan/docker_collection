FROM archlinux/base

# RUN pacman -Syu --noconfirm

RUN pacman -Sy --noconfirm chromium
RUN pacman -Sy --noconfirm coreutils tar less findutils diffutils grep sed gawk util-linux procps-ng
RUN pacman -Sy --noconfirm git zsh sudo curl wget tmux unzip base-devel
RUN pacman -Sy --noconfirm vim
RUN pacman -Sy --noconfirm emacs aspell ack # silversearch-ag is installed after creating user
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
# create user
# -------------------------------------------------------
ARG host_uid=1000
ARG host_gid=1000
ARG user=appuser
RUN groupadd -g $host_gid -o $user
RUN useradd --uid $host_uid --gid $host_gid -G wheel,$user -m -o -s /bin/zsh $user
RUN echo "$user:$user" | chpasswd
# RUN echo "$user ALL=(ALL) ALL" >> /etc/sudoers
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
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
