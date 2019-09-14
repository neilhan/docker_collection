FROM cgineilhan/arch

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
