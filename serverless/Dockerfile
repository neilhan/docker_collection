FROM ubuntu:bionic
MAINTAINER http://neilhan.ca

# Install the appropriate software
RUN apt-get -y update
RUN apt-get install -y bash zsh apt-utils net-tools sudo
RUN apt-get install -y curl wget git jq unzip
RUN apt-get install -y build-essential cmake
RUN apt-get install -y apt-transport-https ca-certificates software-properties-common

# -------------------------------------------------------
# vim neovim
# -------------------------------------------------------
RUN apt-get install -y curl git wget
RUN apt-get install -y build-essential cmake 
RUN apt-get install -y vim
# RUN apt-get install -y neovim ctags python python-neovim python3-neovim xclip xsel markdown ack perl python-dev
# # install fzf
# RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# RUN ~/.fzf/install

# -----------------------------------
# nodejs v11
# -----------------------------------
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs

# -----------------------------------
# aws, serverless
RUN npm install -g serverless

# -----------------------------------
# aws  sam needs docker
# -----------------------------
# docker
RUN apt-get install -y docker.io

RUN apt-get install -y python3 python3-pip python3-dev
RUN pip3 install --upgrade pip
# aws
RUN pip3 install --upgrade awscli
# aws sam
RUN pip3 install --upgrade aws-sam-cli

# gui support -----------------------
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y locales locales-all
RUN apt-get -y install gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget
# # -------------------------------------
# # to run intellij in this docker image
# # -------------------------------------
# RUN apt-get install -y openjfx

# vscode ----------------------------
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
RUN apt-get -y install apt-transport-https
RUN apt-get -y update
RUN apt-get -y install code # or code-insiders

# # --------------------------------------
# # chrome
# # --------------------------------------
# RUN apt-get install -y chromium-browser

# # -------------------------------------------------------
# # -------------------------------------------------------
# # eiamCli intuit auth tool
# # -------------------------------------------------------
# RUN wget http://nexus.intuit.net/nexus/content/repositories/IBP.Intuit-Releases/com/intuit/ebs/eiam/eiamCli-linux/2.2.0/eiamCli-linux-2.2.0.zip
# RUN unzip eiamCli-linux-2.2.0.zip
# RUN bash -c "cd eiamCli-linux; chmod a+rx ./install.sh; ./install.sh"
# RUN chmod a+rx /usr/local/bin/eiamCli
# # -------------------------------------------------------
# # agi intuit tools for Agi services
# # -------------------------------------------------------
# RUN wget https://s3-us-west-2.amazonaws.com/agi-intuit-public-artifacts-166747732012-us-west-2/agi/cli/v0.9.3/v0.9.3_agi-cli_linux_amd64.zip
# RUN unzip v0.9.3_agi-cli_linux_amd64.zip
# RUN mv agi /usr/local/bin/

# -------------------------------------------------------
# emacs, spacemacs
# -------------------------------------------------------
RUN apt-get install -y emacs aspell

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

# -------------------------------------------------------
# emacs, spacemacs
# -------------------------------------------------------

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

CMD ["/bin/zsh"]
