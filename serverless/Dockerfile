FROM cgineilhan/gui
MAINTAINER http://neilhan.ca

RUN apt-get update && apt-get -y upgrade

# # vscode ----------------------------
# RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
# RUN install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
# RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
# RUN apt-get -y install apt-transport-https
# RUN apt-get -y update
# RUN DEBIAN_FRONTEND=noninteractive apt-get -y install code # or code-insiders

# # -----------------------------------
# # aws, sam, serverless, aws-sam needs docker
# # -----------------------------
# # aws
# RUN pip3 install --upgrade awscli
# # aws sam
# RUN pip3 install --upgrade aws-sam-cli
# # aws, serverless
# RUN npm install -g serverless

# --------------------------------------
# java support
# to run intellij in this docker image
# -------------------------------------
# RUN apt-get install -y openjfx
# RUN apt-get install -y openjdk-8-jdk
# RUN apt-get install -y maven

# # -----------------------------------
# # python needed for machine learning
# # -----------------------------------
# RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-pip python3-dev python3-tk python3-venv
# RUN pip3 install --upgrade pip
# RUN pip3 install pudb numpy matplotlib
# RUN apt-get install -y python-opengl
# RUN pip3 install gym
# RUN pip3 install gym[atari]

# --------------------------------------
# 32 bits support. MiniCalc, deRunner needs 32bit env
# --------------------------------------
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386

# -------------------------------------------------------
ARG user=appuser
USER $user
ENV HOME /home/$user

# -------------------------------------------------------
# emacs, spacemacs
# -------------------------------------------------------

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

CMD ["/bin/zsh"]
