FROM docker.io/fedora:28
MAINTAINER http://fedoraproject.org/wiki/Cloud

# RUN label is for atomic cli, allows for ease of use
LABEL RUN='docker run -d -p 5901:5901 -v /etc/machine-id:/etc/machine-id:ro $IMAGE'

# Install the appropriate software
RUN dnf -y update 
RUN dnf -y groupinstall gnome-desktop
RUN dnf -y install tmux git vim gvim maven util-linux-user zsh rsync dpkg gnupg sudo wget
RUN dnf -y install tree

RUN dnf -y install firefox
RUN dnf -y install chromium

RUN dnf -y install python python-pip
RUN pip install PyOpenGL gym

# !!! Please replace nhan2 with your User and Group !!!
RUN export username=nhan2 \
  && groupadd --gid 1000 $username \
  && useradd --uid 1000 --gid 1000 --shell /usr/bin/zsh --create-home $username \
  && usermod $username -a -G wheel 

RUN dnf -y install passwd libuser
RUN echo nhan2 | /usr/bin/passwd nhan2 --stdin

# set bigger font for gnome
RUN su nhan2 -c "gsettings set org.gnome.desktop.interface text-scaling-factor 1.5"
RUN ln -s /home /Users

USER nhan2
ENV HOME /home/nhan2
CMD /usr/bin/zsh
# CMD    ["vncserver", "-fg" ]
# ENTRYPOINT ["vncserver", "-fg" ]
