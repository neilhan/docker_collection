FROM ubuntu:bionic
MAINTAINER http://neilhan.ca

# Install the appropriate software
RUN apt-get -y update 
RUN apt-get install -y fish zsh bash apt-utils net-tools
RUN apt-get install -y curl wget build-essential
RUN apt-get install -y build-essential cmake 
RUN apt-get install -y sudo
RUN apt-get install -y apt-transport-https ca-certificates software-properties-common

# -------------------------------------
# to run intellij in this docker image
# -------------------------------------
# RUN apt-get install -y openjfx

# -----------------------------------
# nodejs v11
# -----------------------------------
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs

# -----------------------------------
RUN npm install -g serverless

# -------------------------------------------------------
# -------------------------------------------------------
# create user
# -------------------------------------------------------
ARG host_uid
ARG host_gid
ARG user=serverless
RUN groupadd -g $host_gid -o $user
RUN echo "$user:x:$host_uid:$host_gid::/home/$user:/usr/bin/zsh" >> /etc/passwd
# RUN useradd --uid $host_uid --gid $host_gid -m -o -s /bin/zsh $user 
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
