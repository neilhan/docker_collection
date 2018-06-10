FROM nvidia/cuda
# nvidia is using ubuntu as base image
# reference: https://www.pugetsystems.com/labs/hpc/Docker-and-NVIDIA-docker-on-your-workstation-Using-Graphical-Applications-915/

RUN apt-get -y update
RUN apt-get install -y firefox 

RUN apt-get install -y sudo tmux git rsync wget curl vim-gnome \
      default-jdk

RUN apt-get install -y python freeglut3-dev python-pip
RUN pip install gym 

# -------------------------------------------------------
# create user
RUN useradd -ms /bin/bash gui 
RUN mkdir -p /home/gui
RUN usermod -aG sudo gui
RUN echo "gui:gui" | chpasswd

# -------------------------------------------------------
# anaconda
USER gui
ENV HOME /home/gui
RUN cd /home/gui; \
  wget https://repo.continuum.io/archive/Anaconda2-4.3.0-Linux-x86_64.sh; \
  bash Anaconda2-4.3.0-Linux-x86_64.sh -b ; 
# ------------------------------------------------------

USER gui
WORKDIR /home/gui

CMD ["/bin/bash"]
