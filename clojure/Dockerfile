FROM ubuntu
MAINTAINER http://neilhan.ca

# Install the appropriate software
RUN apt-get -y update 
RUN apt-get install -y zsh bash apt-utils net-tools unzip wget curl git tmux sudo
RUN apt-get install -y build-essential cmake 
RUN apt-get install -y openssh-client 
RUN apt-get install -y python3
RUN apt-get install -y neovim ctags python3-neovim xclip xsel
RUN apt-get install -y apt-transport-https ca-certificates software-properties-common

RUN apt-get install -y maven

# ------------------------------------
# clojure
# ------------------------------------
RUN apt-get install -y leiningen

# -----------------------------------
# nodejs v11
# -----------------------------------
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs

# -----------------------------------
# Lumo for clojurescript 
# https://github.com/anmonteiro/lumo
# http://lumo-cljs.org/
# -----------------------------------
RUN npm install -g lumo-cljs --unsafe-perm

# -----------------------------------
# clojure script source mapping support
# -----------------------------------
RUN npm install source-map-support

# -------------------------------------------------------
# -------------------------------------------------------
# create user
# -------------------------------------------------------
ARG user=clojure
RUN useradd -ms /bin/bash $user 
RUN mkdir -p /home/$user
RUN usermod -aG sudo $user
RUN echo "$user:$user" | chpasswd
# RUN usermod -aG docker $user

# --------------------------------------------------------
# for mac home directory
RUN ln -s /home /Users
RUN ln -s /bin/sed /usr/bin/sed

# -------------------------------------------------------
USER $user
ENV HOME /home/$user

CMD ["/usr/bin/zsh"]
