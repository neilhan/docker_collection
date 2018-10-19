FROM ubuntu
MAINTAINER http://neilhan.ca

# Install the appropriate software
RUN apt-get -y update 
RUN apt-get install -y zsh apt-utils
RUN apt-get install -y bash  ctags  curl  git  python 
RUN apt-get install -y build-essential cmake ruby ruby-dev 
RUN apt-get install -y rubygems openssh-client tmux sudo
RUN apt-get install -y maven
RUN gem install sshx
RUN gem install --no-ri --no-rdoc fpm

# -------------------------------------------------------
# create user
RUN useradd -ms /bin/bash gui 
RUN mkdir -p /home/gui
RUN usermod -aG sudo gui
RUN echo "gui:gui" | chpasswd

# --------------------------------------------------------
# for mac home directory
RUN ln -s /home /Users
RUN ln -s /bin/sed /usr/bin/sed

# -------------------------------------------------------
USER gui
ENV HOME /home/gui

CMD ["/usr/bin/zsh"]
