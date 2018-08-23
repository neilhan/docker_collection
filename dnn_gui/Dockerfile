FROM tensorflow/tensorflow:latest-gpu-py3
# nvidia is using ubuntu as base image
# reference: https://www.pugetsystems.com/labs/hpc/Docker-and-NVIDIA-docker-on-your-workstation-Using-Graphical-Applications-915/

RUN apt-get -y update

RUN apt-get install -y zsh bash 
RUN apt-get install -y sudo tmux git rsync wget curl \
        vim ctags curl git python python-dev python-pip
RUN apt-get install -y build-essential cmake perl
RUN apt-get install -y markdown

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim-gnome locales locales-all

RUN apt-get install -y default-jdk prelink

RUN apt-get install -y freeglut3-dev python-pip python-tk
RUN apt-get install -y ffmpeg

RUN pip install --upgrade pip
RUN pip install pudb six
RUN pip install gym matplotlib numpy pandas tensorflow

# -------------------------------------------------------
# create user
RUN useradd -ms /bin/bash gui 
RUN mkdir -p /home/gui
RUN usermod -aG sudo gui
RUN echo "gui:gui" | chpasswd

# --------------------------------------------------------
# for mac home directory
RUN ln -s /home /Users

# # -------------------------------------------------------
# # anaconda
# USER gui
# ENV HOME /home/gui
# RUN cd /home/gui; \
#   wget https://repo.continuum.io/archive/Anaconda2-4.3.0-Linux-x86_64.sh; \
#   bash Anaconda2-4.3.0-Linux-x86_64.sh -b ; 

# -------------------------------------------------------
USER gui
WORKDIR /home/gui

CMD ["/usr/bin/zsh"]
