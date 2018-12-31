FROM ubuntu:bionic
MAINTAINER http://neilhan.ca

# Install the appropriate software
RUN apt-get -y update 
RUN apt-get install -y zsh apt-utils neovim
RUN apt-get install -y bash  ctags curl git python wget build-essential
RUN apt-get install -y build-essential cmake 
RUN apt-get install -y openssh-client tmux sudo
RUN apt-get install -y apt-transport-https ca-certificates curl software-properties-common
RUN apt-get install -y maven
# ----------------------------------
# sshx install
# ----------------------------------
RUN apt-get install -y rubygems ruby ruby-dev
RUN gem install sshx
RUN gem install --no-ri --no-rdoc fpm  # rpm tool

# -------------------------------------------------------
# -------------------------------------------------------
# create user
ARG user=sshx
RUN useradd -ms /bin/bash sshx 
RUN mkdir -p /home/sshx
RUN usermod -aG sudo sshx
RUN echo "sshx:sshx" | chpasswd
RUN usermod -aG docker sshx

# --------------------------------------------------------
# for mac home directory
RUN ln -s /home /Users
RUN ln -s /bin/sed /usr/bin/sed

# -------------------------------------------------------
USER sshx
ENV HOME /home/sshx

CMD ["/usr/bin/zsh"]
