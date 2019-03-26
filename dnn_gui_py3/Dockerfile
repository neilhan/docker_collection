FROM ubuntu:bionic
# FROM tensorflow/tensorflow:latest-gpu-py3
# nvidia is using ubuntu as base image
# reference: https://www.pugetsystems.com/labs/hpc/Docker-and-NVIDIA-docker-on-your-workstation-Using-Graphical-Applications-915/

RUN apt-get -y update

RUN apt-get install -y zsh bash 
RUN apt-get install -y sudo tmux git rsync wget curl \
        ctags curl git python3 python3-dev python3-pip
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
# nvidia cuda. From https://www.tensorflow.org/install/gpu
# -------------------------------------------------------
# Add NVIDIA package repositories
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
RUN dpkg -i cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
RUN apt-get update -y
RUN wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
RUN apt install -y ./nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
RUN apt-get update -y

# Install NVIDIA driver
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends nvidia-driver-410
# Reboot. Check that GPUs are visible using the command: nvidia-smi

# Install development and runtime libraries (~4GB)
RUN apt-get install -y --no-install-recommends \
    cuda-10-0 \
    libcudnn7=7.4.1.5-1+cuda10.0  \
    libcudnn7-dev=7.4.1.5-1+cuda10.0


# Install TensorRT. Requires that libcudnn7 is installed above.
RUN apt-get update -y && \
        apt-get install -y nvinfer-runtime-trt-repo-ubuntu1804-5.0.2-ga-cuda10.0 \
        && apt-get update -y \
        && apt-get install -y --no-install-recommends libnvinfer-dev=5.0.2-1+cuda10.0

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
