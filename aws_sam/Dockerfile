FROM ubuntu:bionic
MAINTAINER http://neilhan.ca

# Install the appropriate software
RUN apt-get -y update 
RUN apt-get install -y zsh apt-utils neovim net-tools
RUN apt-get install -y bash  ctags curl git python wget build-essential
RUN apt-get install -y build-essential cmake 
RUN apt-get install -y openssh-client tmux sudo
RUN apt-get install -y apt-transport-https ca-certificates curl software-properties-common
RUN apt-get install -y maven

# -----------------------------------
# docker
# -----------------------------------
RUN apt-get install -y docker.io

# -----------------------------------
# aws  sam needs docker
# -----------------------------
RUN apt-get install -y python-pip python-dev build-essential 
RUN pip install --upgrade pip
# aws
RUN pip install --upgrade awscli  # --user
# aws sam
RUN pip install --upgrade aws-sam-cli

# ------------------------------------------
# install serverless framework
# ------------------------------------------
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g serverless

# -------------------------------------------------------
# -------------------------------------------------------
# create user
# -------------------------------------------------------
ARG user=aws_sam
RUN useradd -ms /bin/bash $user 
RUN mkdir -p /home/$user
RUN usermod -aG sudo $user
RUN echo "$user:$user" | chpasswd
RUN usermod -aG docker $user

# --------------------------------------------------------
# for mac home directory
RUN ln -s /home /Users
RUN ln -s /bin/sed /usr/bin/sed

# -------------------------------------------------------
USER $user
ENV HOME /home/$user

CMD ["/usr/bin/zsh"]
