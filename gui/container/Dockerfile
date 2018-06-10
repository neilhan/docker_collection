FROM docker.io/fedora:28
MAINTAINER http://fedoraproject.org/wiki/Cloud

# RUN label is for atomic cli, allows for ease of use
LABEL RUN='docker run -d -p 5901:5901 -v /etc/machine-id:/etc/machine-id:ro $IMAGE'

# Install the appropriate software
RUN dnf -y update 
RUN dnf -y groupinstall gnome-desktop
RUN dnf -y install tmux git vim gvim maven util-linux-user rsync dpkg gnupg sudo wget
RUN dnf -y install tree tilix zsh

RUN dnf -y install firefox
RUN dnf -y install chromium

RUN echo "fs.inotify.max_user_watches = 524288" >> /etc/sysctl.conf 

# install VS Code --------------------------------
RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc
RUN sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

RUN dnf -y update
RUN dnf -y install code

# user name set to gui
# ------------------------------------------------------
RUN export username=gui \
  && groupadd --gid 1000 $username \
  && useradd --uid 1000 --gid 1000 --shell /usr/bin/bash --create-home $username \
  && usermod $username -a -G wheel 

# set user password so that sudo works, password is "gui"
RUN dnf -y install passwd libuser   
RUN echo gui | /usr/bin/passwd gui --stdin  
RUN chown -R gui:gui /home/gui

# install pulse secure VPN --------------------------
RUN dnf -y install ca-certificates
RUN update-ca-trust force-enable
RUN update-ca-trust extract
RUN su gui -c "mkdir /home/gui/temp"
RUN wget -O /home/gui/temp/ps.rpm http://trial.pulsesecure.net/clients/ps-pulse-linux-5.3r3.0-b1021-centos-rhel-64-bit-installer.rpm
RUN dnf -y install /home/gui/temp/ps.rpm
RUN /usr/local/pulse/PulseClient_x86_64.sh install_dependency_packages


# node.js 6 install ---------------------------------------
# copy from docker node 6.11 ------
# RUN groupadd --gid 1000 node \
#   && useradd --uid 1000 --gid node --shell /bin/bash --create-home node

# gpg keys listed at https://github.com/nodejs/node#release-team
RUN set -ex \
  && for key in \
    94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
    FD3A5288F042B6850C66B31F09FE44734EB7990E \
    71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
    DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
    C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
    B9AE9905FFD7803F25714661B63B535A4C206CA9 \
    56730D5401028683275BD23C23EFEFE93C4CFFFE \
    77984A986EBC2AA786BC0F66B01FBB92821C587A \
  ; do \
    gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" || \
    gpg --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "$key" || \
    gpg --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" ; \
  done

ENV NODE_VERSION 6.13.0

RUN ARCH= && dpkgArch="$(dpkg --print-architecture)" \
  && case "${dpkgArch##*-}" in \
    amd64) ARCH='x64';; \
    ppc64el) ARCH='ppc64le';; \
    *) echo "unsupported architecture"; exit 1 ;; \
  esac \
  && curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH.tar.xz" \
  && curl -SLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
  && gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc \
  && grep " node-v$NODE_VERSION-linux-$ARCH.tar.xz\$" SHASUMS256.txt | sha256sum -c - \
  && tar -xJf "node-v$NODE_VERSION-linux-$ARCH.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
  && rm "node-v$NODE_VERSION-linux-$ARCH.tar.xz" SHASUMS256.txt.asc SHASUMS256.txt \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs

ENV YARN_VERSION 1.3.2

RUN set -ex \
  && for key in \
    6A010C5166006599AA17F08146C2130DFD2497F5 \
  ; do \
    gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" || \
    gpg --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "$key" || \
    gpg --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" ; \
  done \
  && curl -fSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
  && curl -fSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz.asc" \
  && gpg --batch --verify yarn-v$YARN_VERSION.tar.gz.asc yarn-v$YARN_VERSION.tar.gz \
  && mkdir -p /opt/yarn \
  && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/yarn --strip-components=1 \
  && ln -s /opt/yarn/bin/yarn /usr/local/bin/yarn \
  && ln -s /opt/yarn/bin/yarn /usr/local/bin/yarnpkg \
  && rm yarn-v$YARN_VERSION.tar.gz.asc yarn-v$YARN_VERSION.tar.gz

### CMD [ "node" ]
# node 6 ends // ----------------------------------------------------

# set bigger font for gnome
RUN su gui -c "gsettings set org.gnome.desktop.interface text-scaling-factor 1.5"
RUN ln -s /home /Users

USER gui
ENV HOME /home/gui
CMD /usr/bin/bash
# CMD    ["vncserver", "-fg" ]
# ENTRYPOINT ["vncserver", "-fg" ]
