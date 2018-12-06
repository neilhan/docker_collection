FROM ubuntu:bionic
MAINTAINER http://neilhan.ca

# Install the appropriate software
RUN apt-get -y update 
RUN apt-get install -y zsh apt-utils
RUN apt-get install -y bash  ctags curl git python wget build-essential
RUN apt-get install -y build-essential cmake 
RUN apt-get install -y openssh-client tmux sudo
RUN apt-get install -y apt-transport-https ca-certificates curl software-properties-common
RUN apt-get install -y maven
# ----------------------------------
RUN apt-get install -y rubygems ruby ruby-dev
RUN gem install sshx
RUN gem install --no-ri --no-rdoc fpm  # rpm tool

# -----------------------------------
# RUN wget -qO- https://deb.nodesource.com/setup_10.x | sudo -E bash -
# RUN apt-get install -y nodejs

# RUN npm install aws-es-curl -g

# -----------------------------------
RUN apt-get install -y docker.io

# -----------------------------------
# aws  sam needs docker
# -----------------------------
RUN apt-get install -y python-pip python-dev build-essential 
RUN pip install --upgrade pip
RUN pip install --upgrade awscli  # --user
# aws sam
RUN pip install --upgrade aws-sam-cli

# -------------------------------------------------------
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update -y
RUN apt-get install -y kubectl
# kubeless 
# -------------------------------------------------------
RUN curl -OL https://github.com/kubeless/kubeless/releases/download/v1.0.0/kubeless_linux-amd64.zip && \
  unzip kubeless_linux-amd64.zip && \
  mv bundles/kubeless_linux-amd64/kubeless /usr/local/bin/ && \
  rm -rf bundles && rm kubeless_linux-amd64.zip

# -------------------------------------------------------
# -------------------------------------------------------
# create user
RUN useradd -ms /bin/bash gui 
RUN mkdir -p /home/gui
RUN usermod -aG sudo gui
RUN echo "gui:gui" | chpasswd
RUN usermod -aG docker gui

# --------------------------------------------------------
# for mac home directory
RUN ln -s /home /Users
RUN ln -s /bin/sed /usr/bin/sed

# -------------------------------------------------------
USER gui
ENV HOME /home/gui

CMD ["/usr/bin/zsh"]
