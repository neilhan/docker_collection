FROM ubuntu
MAINTAINER http://neilhan.ca

# Install the appropriate software
RUN apt-get -y update 
RUN apt-get install -y zsh bash apt-utils sudo
RUN apt-get install -y curl git wget
RUN apt-get install -y build-essential cmake 
RUN apt-get install -y neovim ctags python python-neovim python3-neovim xclip xsel markdown ack perl python-dev
# install fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
RUN ~/.fzf/install

# -------------------------------------------------------
# emacs
# -------------------------------------------------------
RUN apt-get install -y emacs

# -------------------------------------------------------
# -------------------------------------------------------
# create user
# -------------------------------------------------------
ARG user=vim
ARG host_uid=1000
ARG host_gid=1000
RUN groupadd -g $host_gid -o $user
# RUN useradd -u $host_uid -g $user -o -m -s /usr/bin/zsh $user 
RUN echo "$user:x:$host_uid:$host_gid::/home/$user:/usr/bin/zsh" >> /etc/passwd
RUN usermod -aG sudo $user
RUN echo "$user:$user" | chpasswd
RUN mkdir /home/$user; chown $user:$user /home/$user

# --------------------------------------------------------
# for mac home directory
RUN ln -s /home /Users

# -------------------------------------------------------
USER $user
ENV HOME /home/$user

CMD ["/usr/bin/zsh"]
