# Builds a ubuntu image with common development tools and an account for the current host user.
#
# Typical use:
# docker build -f ./ubuntu.dockerfile -t foo --build-arg UID=$(id -u) --build-arg USERNAME=$(whoami)
# docker run -it --volume $HOME:/home/$(whoami) foo

FROM ubuntu
RUN apt-get update && apt-get install -y \
    build-essential \
    sudo \
    git \
    neovim
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
ARG UID
ARG USERNAME
RUN useradd --create-home --shell /bin/bash --uid $UID --gid users --groups sudo $USERNAME
USER $USERNAME
WORKDIR /home/$USERNAME
