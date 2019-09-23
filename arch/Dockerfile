FROM archlinux/base

# RUN pacman -Syu --noconfirm

RUN pacman -Sy --noconfirm coreutils tar less findutils diffutils grep sed gawk util-linux procps-ng
RUN pacman -Sy --noconfirm git zsh sudo curl wget tmux unzip base-devel openssh make

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

COPY docker_install.sh /root/docker_install.sh
RUN /root/docker_install.sh

USER root
