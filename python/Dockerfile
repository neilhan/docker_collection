FROM ubuntu:rolling
MAINTAINER http://neilhan.ca

# Install the appropriate software
RUN apt-get update && apt-get install -y bash zsh apt-utils net-tools curl wget git jq unzip tmux sudo tree
# RUN apt-get update && apt-get install -y --fix-missing build-essential cmake
RUN apt-get install -y apt-transport-https ca-certificates software-properties-common
RUN apt-get update && apt-get -y upgrade

# gui support -----------------------
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y locales locales-all

# -----------------------------------
# node.js v11, install node.js
# -----------------------------------
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn

# -------------------------------------------------------
# vim neovim
# -------------------------------------------------------
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim vim-gtk
RUN apt-get install -y xclip xsel ack

# -------------------------------------------------------
# emacs, spacemacs
# -------------------------------------------------------
# RUN apt-get install -y xclip xsel ack
RUN apt-get install -y emacs aspell ack silversearcher-ag
RUN npm install -g js-beautify
RUN npm install -g eslint eslint-plugin-jest tern jsonlint standard
# RUN npm install -g jshint

# -----------------------------------
# python needed for machine learning
# -----------------------------------
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-pip python3-dev python3-tk python3-venv
RUN pip3 install --upgrade pip
RUN pip3 install pudb numpy matplotlib
RUN pip3 install Django

# -------------------------------------------------------
# create user
# -------------------------------------------------------
ARG host_uid=1000
ARG host_gid=1000
ARG user=appuser
RUN groupadd -g $host_gid -o $user
# RUN groupadd docker
RUN echo "$user:x:$host_uid:$host_gid::/home/$user:/usr/bin/zsh" >> /etc/passwd
# RUN useradd --uid $host_uid --gid $host_gid -m -o -s /bin/zsh $user
RUN usermod -aG sudo $user
RUN echo "$user:$user" | chpasswd
# --------------------------------------------------------
# for mac home directory
RUN ln -s /home /Users

# --------------------------------------------------------
# update user to local userid.
ARG USER_NAME
ARG USER_ID
ARG GROUP_NAME
ARG GROUP_ID

USER root

# userdel -f ${USER_NAME} &&
RUN if [ ${USER_ID:-0} -ne 0 ] && [ ${GROUP_ID:-0} -ne 0 ]; then \
      if getent passwd appuser ; then userdel appuser; fi &&\
      if getent passwd ${USER_NAME} ; then userdel ${USER_NAME}; fi &&\
      if getent group appuser ; then groupdel appuser; fi &&\
      if getent group ${GROUP_NAME} ; then groupdel ${GROUP_NAME}; fi &&\
      groupadd -g ${GROUP_ID} ${GROUP_NAME} &&\
      useradd -l -u ${USER_ID} -g ${GROUP_NAME} ${USER_NAME} &&\
      usermod -aG sudo ${USER_NAME} &&\
      install -d -m 0755 -o ${USER_NAME} -g ${GROUP_NAME} /home/${USER_NAME} &&\
      chown --changes --silent --no-dereference --recursive \
        --from=1000:1000 ${USER_ID}:${GROUP_ID} \
        /home/${USER_NAME} && \
      echo "${USER_NAME}:${USER_NAME}" | chpasswd \
  ;fi

USER ${USER_NAME}

CMD zsh
