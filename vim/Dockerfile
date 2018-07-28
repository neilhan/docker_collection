FROM ubuntu
MAINTAINER http://neilhan.ca

# Install the appropriate software
RUN apt-get -y update 
RUN apt-get install -y vim zsh
RUN apt-get install -y bash  ctags  curl  git  python 
RUN apt-get install -y build-essential cmake perl python-dev
# --------------------------------------------------------
# gvim gnome UI
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module firefox
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim-gnome
# -------------------------------------------------------
# create user
RUN useradd -ms /bin/bash gui 
RUN mkdir -p /home/gui
RUN usermod -aG sudo gui
RUN echo "gui:gui" | chpasswd

RUN ln -s /home /Users

USER gui
ENV HOME /home/gui

# COPY vimrc /home/gui/.vimrc
VOLUME /home/gui/.vim

CMD ["/usr/bin/zsh"]
# CMD    ["vncserver", "-fg" ]
# ENTRYPOINT ["vncserver", "-fg" ]
