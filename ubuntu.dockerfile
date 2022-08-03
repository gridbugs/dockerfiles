# Builds a ubuntu image with common development tools and an account for the current host user.
#
# Typical use:
# docker build -f ubuntu.dockerfile -t base --build-arg UID=$(id -u) --build-arg USERNAME=$(whoami) .
# docker run -it --volume $HOME:/home/$(whoami) base

FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN yes | unminimize

# Install handy tools
RUN apt-get update && apt-get upgrade && apt-get install -y \
    build-essential \
    pkg-config \
    nodejs \
    man-db \
    tzdata \
    sudo \
    git \
    tmux \
    neovim \
    ripgrep \
    htop

# Install common dev libraries
RUN apt-get update && apt-get upgrade && apt-get install -y \
    libx11-dev \
    mesa-common-dev \
    libegl1-mesa-dev \
    libgles2-mesa-dev

RUN ln -snf /usr/share/zoneinfo/Australia/Sydney /etc/localtime
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
ARG UID
ARG USERNAME
RUN useradd --create-home --shell /bin/bash --uid $UID --gid users --groups sudo $USERNAME
USER $USERNAME
WORKDIR /home/$USERNAME
