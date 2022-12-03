FROM gridbugs-dev-ubuntu

# The version of repo in ubuntu's repo is too old, so install it from upstream
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && chmod a+x ~/bin/repo

# The version of the protobuf compiler in ubuntu's repo is too old, so install it from upstream
RUN cd /tmp && \
  curl -LO https://github.com/protocolbuffers/protobuf/releases/download/v21.10/protoc-21.10-linux-x86_64.zip && \
  unzip protoc-21.10-linux-x86_64.zip -d $HOME/.local

# Install python deps
RUN . ~/.profile && \
  pip3 install --user \
  setuptools \
  sel4-deps \
  protobuf \
  sh \
  sortedcontainers \
  ;

USER root

RUN apt-get update && \
  apt-get install -y \
  python-is-python3 \
  cmake \
  cmake-curses-gui \
  ninja-build \
  doxygen \
  libxml2-utils \
  ncurses-dev \
  qemu-system-x86 \
  qemu-system-misc \
  cpio \
  ;

USER $USERNAME

