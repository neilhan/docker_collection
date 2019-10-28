FROM cgineilhan/arch
MAINTAINER http://neilhan.ca

# install haskell compiler
RUN pacman -Sy --noconfirm ghc make libffi zlib gmp
# RUN pacman -Sy --noconfirm libtinfo ?? is libtinfo required
# install stack
RUN curl -sSL https://get.haskellstack.org/ | sh

# ----------------------------------------------------------------
# user related
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
  gpasswd -a ${USER_NAME} wheel &&\
  install -d -m 0755 -o ${USER_NAME} -g ${GROUP_NAME} /home/${USER_NAME} &&\
  chown --changes --silent --no-dereference --recursive \
  --from=1000:1000 ${USER_ID}:${GROUP_ID} \
  /home/${USER_NAME} && \
  echo "${USER_NAME}:${USER_NAME}" | chpasswd \
  ;fi

USER ${USER_NAME}

CMD zsh
# ## ensure locale is set during build
# ENV LC_ALL=C.UTF-8
# ENV LANG=C.UTF-8
# ENV LANG            C.UTF-8

# RUN apt-get update -y
# RUN apt-get upgrade -y
# RUN apt-get install -y haskell-platform cabal-install alex
# RUN apt-get install -y --no-install-recommends zlib1g-dev libtinfo-dev libsqlite3-0 libsqlite3-dev ca-certificates g++
# RUN curl -sSL https://get.haskellstack.org/ | sh

# # -------------------------------------------------------
# # -------------------------------------------------------
# # create user
# # -------------------------------------------------------
# ARG host_uid
# ARG host_gid
# ARG user=haskell
# RUN groupadd -g $host_gid -o $user
# # RUN groupadd docker
# RUN echo "$user:x:$host_uid:$host_gid::/home/$user:/usr/bin/zsh" >> /etc/passwd
# # RUN useradd --uid $host_uid --gid $host_gid -m -o -s /bin/zsh $user
# RUN usermod -aG sudo $user
# # RUN usermod -aG docker $user
# RUN echo "$user:$user" | chpasswd
# # --------------------------------------------------------
# # for mac home directory
# RUN ln -s /home /Users
# # RUN ln -s /bin/sed /usr/bin/sed
# # -------------------------------------------------------
# EXPOSE 3000

# # VOLUME /home/$user/.ghc
# # VOLUME /home/$user/.stack
# # VOLUME /home/$user/.local
# VOLUME /HOME/$user/Projects

# USER $user
# ENV HOME /home/$user
# ENV PATH /root/.cabal/bin:/root/.local/bin:/opt/cabal/2.0/bin:\
#   /opt/ghc/8.2.1/bin:/opt/happy/1.19.5/bin:/opt/alex/3.1.7/bin:\
#   /home/hs/.local/bin:$PATH
# WORKDIR /home/$user

# # RUN touch /home/$user/.zshrc
# # RUN chown $user /home/$user/.zshrc

# CMD ["/bin/zsh"]
