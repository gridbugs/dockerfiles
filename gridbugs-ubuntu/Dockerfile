FROM ubuntu

RUN apt-get update && apt-get upgrade -y
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata && \
  ln -snf /usr/share/zoneinfo/Australia/Sydney /etc/localtime

RUN apt-get update && apt-get install -y software-properties-common

#RUN add-apt-repository ppa:neovim-ppa/unstable

RUN apt-get update && apt-get install -y \
  build-essential \
  pkg-config \
  strace \
  man-db \
  tzdata \
  sudo \
  git \
  rsync \
  mercurial \
  tmux \
  neovim \
  ripgrep \
  htop \
  bash-completion \
  curl \
  clang \
  clangd \
  gcc \
  gdb \
  zip \
  wget \
  file \
  direnv \
  fzf \
  locales \
  ;

RUN sudo add-apt-repository ppa:neovim-ppa/unstable -y
RUN sudo apt update -y
RUN sudo apt install -y neovim

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Remove the ubuntu user so its uid can be reused
RUN userdel -r ubuntu

ARG UID
ARG USERNAME
ENV UID=$UID
ENV USERNAME=$USERNAME
ENV HOME=/home/$USERNAME
RUN useradd --create-home --shell /bin/bash --uid $UID --gid users --groups sudo $USERNAME
USER $USERNAME
WORKDIR $HOME

RUN mkdir $HOME/bin

RUN rm -f .bashrc .profile && \
  git clone --depth=1 https://github.com/gridbugs/dotfiles .dotfiles && \
  .dotfiles/install.sh

RUN cd .dotfiles && git remote rm origin && git remote add origin git@github.com:gridbugs/dotfiles

# Install all the neovim plugins specified in the dotfiles repo
RUN nvim -c qa

COPY gitconfig $HOME/.gitconfig
