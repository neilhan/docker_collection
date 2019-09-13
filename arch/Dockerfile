FROM archlinux/base

RUN pacman -Sy firefox xorg-server --noconfirm
RUN pacman -Sy --noconfirm coreutils tar less findutils diffutils grep sed gawk util-linux procps-ng
RUN pacman -Sy git emacs --noconfirm

RUN mkdir -p /root/.conf/dconf
RUN chown -R root:root /root
# git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
# USER 1000
