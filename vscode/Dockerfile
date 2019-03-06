FROM ubuntu:bionic
MAINTAINER http://neilhan.ca

# Install the appropriate software
RUN apt-get -y update 
RUN apt-get install -y fish zsh bash apt-utils net-tools
RUN apt-get install -y curl wget build-essential git
RUN apt-get install -y build-essential cmake 
RUN apt-get install -y sudo
RUN apt-get install -y apt-transport-https ca-certificates software-properties-common

# -----------------------------------
# nodejs v8.10
# -----------------------------------
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

# some tools ------------------------
RUN npm install -g serverless

# gui support -----------------------
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y locales locales-all
RUN apt-get -y install gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget

# vscode ----------------------------
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
RUN apt-get -y install apt-transport-https
RUN apt-get -y update
RUN apt-get -y install code # or code-insiders

# -------------------------------------------------------
# -------------------------------------------------------
# create user
# -------------------------------------------------------
ARG host_uid
ARG host_gid
ARG user=vscode
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

CMD ["/bin/bash"]
