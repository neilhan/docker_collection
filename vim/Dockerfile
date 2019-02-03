FROM ubuntu
MAINTAINER http://neilhan.ca

# Install the appropriate software
RUN apt-get -y update 
RUN apt-get install -y zsh apt-utils
RUN apt-get install -y bash  ctags  curl  git  python 
RUN apt-get install -y build-essential cmake perl python-dev
RUN apt-get install -y neovim python-neovim python3-neovim xclip xsel
RUN apt-get install -y markdown ack
# --------------------------------------------------------
# # gvim gnome UI
# RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module
# RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim-gnome locales locales-all

# ------------------------------------------
# set utf-c Canada English
# RUN apt-get install -y language-pack-zh* chinese* fonts-arphic-ukai fonts-arphic-uming fonts-ipafont-mincho fonts-ipafont-gothic fonts-unfonts-core
# RUN locale-gen en_CA.UTF-8

# COPY ./default_locale /etc/default/locale
# RUN chmod 0755 /etc/default/locale

# ENV LC_ALL=en_CA.UTF-8
# ENV LANG=en_CA.UTF-8
# ENV LANGUAGE=en_CA.UTF-8

# -------------------------------------------------------
# -------------------------------------------------------
# create user
# -------------------------------------------------------
ARG user=vim
RUN useradd -ms /bin/bash $user 
RUN mkdir -p /home/$user
RUN usermod -aG sudo $user
RUN echo "$user:$user" | chpasswd

# --------------------------------------------------------
# for mac home directory
RUN ln -s /home /Users

# -------------------------------------------------------
USER $user
ENV HOME /home/$user

CMD ["/usr/bin/zsh"]
