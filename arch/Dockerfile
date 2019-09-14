FROM archlinux/base

# RUN pacman -Syu --noconfirm

RUN pacman -Sy --noconfirm chromium
RUN pacman -Sy --noconfirm coreutils tar less findutils diffutils grep sed gawk util-linux procps-ng
RUN pacman -Sy --noconfirm git zsh sudo curl wget tmux unzip
RUN pacman -Sy --noconfirm vim
RUN pacman -Sy --noconfirm emacs aspell ack
  # silversearch-ag
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

RUN pacman -Sy --noconfirm base-devel
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
RUN echo "$user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
# --------------------------------------------------------
# for mac home directory
RUN ln -s /home /Users
# git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

USER appuser
WORKDIR /home/appuser
RUN git clone https://aur.archlinux.org/yay.git && \
  cd yay && \
  echo $user | makepkg -si --noconfirm
