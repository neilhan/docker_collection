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

# ------------------------------------
# clojure
# ------------------------------------
RUN apt-get install -y leiningen

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
# kubectl 
# -------------------------------------------------------
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update -y
RUN apt-get install -y kubectl
# -------------------------------------------------------
# kubeless 
# -------------------------------------------------------
# RUN curl -OL https://github.com/kubeless/kubeless/releases/download/v1.0.0/kubeless_linux-amd64.zip && \
#   unzip kubeless_linux-amd64.zip && \
#   mv bundles/kubeless_linux-amd64/kubeless /usr/local/bin/ && \
#   rm -rf bundles && rm kubeless_linux-amd64.zip

# -------------------------------------------------------
# -------------------------------------------------------
# create user
# -------------------------------------------------------
ARG user=clojure
RUN useradd -ms /bin/bash clojure 
RUN mkdir -p /home/clojure
RUN usermod -aG sudo clojure
RUN echo "clojure:clojure" | chpasswd
RUN usermod -aG docker clojure

# --------------------------------------------------------
# for mac home directory
RUN ln -s /home /Users
RUN ln -s /bin/sed /usr/bin/sed

# -------------------------------------------------------
USER clojure
ENV HOME /home/clojure

CMD ["/usr/bin/zsh"]
