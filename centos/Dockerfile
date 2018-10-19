# # to run with a tensorflow image withou GPU support, use latest instead of lates-gpu
FROM docker.io/centos

# RUN label is for atomic cli, allows for ease of use
# LABEL RUN='docker run -d -p 5901:5901 -v /etc/machine-id:/etc/machine-id:ro $IMAGE'

RUN yum -y update
RUN yum -y install epel-release
RUN yum -y update
RUN yum -y install deltarpm

# ------------------------------------------------------
# Install the gui packages appropriate software
# RUN yum -y groupinstall "GNOME Desktop" "Graphical Administration Tools"
# # set bigger font for gnome ---------------
# RUN su gui -c "gsettings set org.gnome.desktop.interface text-scaling-factor 1.5"
RUN yum -y install tmux git vim maven util-linux-user \
            rsync dpkg gnupg sudo wget vim bash
RUN yum -y install tree tilix maven fpm

RUN echo "fs.inotify.max_user_watches = 524288" >> /etc/sysctl.conf

# user name set to gui
RUN export username=gui \
  && groupadd --gid 1000 $username \
  && useradd --uid 1000 --gid 1000 --shell /usr/bin/bash --create-home $username \
  && usermod $username -a -G wheel

# set user password so that sudo works, password is "gui"
RUN yum -y install passwd libuser
RUN echo gui | /usr/bin/passwd gui --stdin
RUN chown -R gui:gui /home/gui

RUN ln -s /home /Users

# ------------------------------------------------------
# ------------------------------------------------------
USER gui
ENV HOME /home/gui
CMD /usr/bin/bash

