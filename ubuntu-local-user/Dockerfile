FROM ubuntu

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  sudo \
  ;

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
ENV HOME=/home/user
RUN useradd --create-home --shell /bin/bash --gid users --groups sudo user
USER user
WORKDIR $HOME
