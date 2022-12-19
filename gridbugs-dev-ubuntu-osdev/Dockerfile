FROM gridbugs-dev-ubuntu

USER root

RUN apt-get update && \
  apt-get install -y \
  qemu-system-x86 \
  ;

USER $USERNAME

RUN git clone --depth=1 https://gitlab.com/bztsrc/bootboot.git /tmp/bootboot && \
  cd /tmp/bootboot/mkbootimg && \
  make && \
  mkdir -p ~/bin && \
  cp mkbootimg ~/bin

