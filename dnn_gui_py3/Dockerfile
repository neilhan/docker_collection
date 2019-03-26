FROM tensorflow/tensorflow:latest-gpu-py3
# nvidia is using ubuntu as base image
# reference: https://www.pugetsystems.com/labs/hpc/Docker-and-NVIDIA-docker-on-your-workstation-Using-Graphical-Applications-915/
# FROM ubuntu:bionic

RUN apt-get update -y

RUN apt-get install -y zsh bash 
RUN apt-get install -y sudo tmux git rsync wget curl ctags curl git python3 python3-dev python3-pip
RUN apt-get install -y build-essential cmake perl
RUN apt-get install -y markdown

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y locales locales-all

RUN apt-get install -y default-jdk prelink

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y freeglut3-dev python3-pip python3-tk
RUN apt-get install -y ffmpeg

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10
RUN pip3 install --upgrade pip
RUN pip3 install pudb six
RUN pip3 install gym matplotlib numpy pandas
# RUN pip3 install tensorflow 
RUN pip3 install tensorflow-gpu
RUN pip3 install selenium
RUN apt-get install -y chromium-chromedriver

# -------------------------------------------------------
# create user
ARG user=dnn_gui_py3
RUN useradd -ms /bin/bash $user 
RUN mkdir -p /home/$user
RUN usermod -aG sudo $user
RUN echo "$user:$user" | chpasswd

# --------------------------------------------------------
# for mac home directory
RUN ln -s /home /Users

# # -------------------------------------------------------
# # anaconda
# USER $user
# ENV HOME /home/$user
# RUN cd /home/$user; \
#   wget https://repo.continuum.io/archive/Anaconda2-4.3.0-Linux-x86_64.sh; \
#   bash Anaconda2-4.3.0-Linux-x86_64.sh -b ; 

# -------------------------------------------------------
USER $user
WORKDIR /home/$user

CMD ["/usr/bin/zsh"]
