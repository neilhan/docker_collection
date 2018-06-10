FROM nvidia/cuda

RUN apt-get -y update
RUN apt-get install -y sudo tmux git rsync wget curl
RUN apt-get install -y vim-gnome
RUN apt-get install -y python freeglut3-dev python-pip
RUN pip install gym 

# -------------------------------------------------------
# create user
RUN useradd -ms /bin/bash gui 
RUN mkdir -p /home/gui
RUN usermod -aG sudo gui
RUN echo "gui:gui" | chpasswd

# # Replace 1000 with your user / group id
# RUN export uid=1000 gid=1000 && \
#     echo "gui:x:${uid}:${gid}:gui,,,:/home/gui:/bin/bash" >> /etc/passwd && \
#     echo "gui:x:${uid}:" >> /etc/group && \
#     echo "gui ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/gui && \
#     chmod 0440 /etc/sudoers.d/gui && \
#     chown ${uid}:${gid} -R /home/gui
 
# COPY --chown=1000:1000 bashrc /home/gui/.bashrc

# RUN rm -rf /notebooks/*
# ADD *.ipynb /notebooks/

# VOLUME /notebooks/src
# VOLUME /notebooks/data

# WORKDIR /notebooks
# CMD ["/run_jupyter.sh"]

USER gui
WORKDIR /home/gui

CMD ["/bin/bash"]
