FROM ubuntu

RUN yes | unminimize && apt-get update && apt-get upgrade -y
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata && \
  ln -snf /usr/share/zoneinfo/Australia/Sydney /etc/localtime

RUN apt-get update && apt-get install -y software-properties-common

RUN add-apt-repository ppa:neovim-ppa/unstable

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
  darcs \
  tmux \
  neovim \
  ripgrep \
  htop \
  opam \
  python3 \
  python3-pip \
  python3-pynvim \
  bash-completion \
  curl \
  clang \
  clangd \
  gcc \
  gdb \
  zip \
  wget \
  file \
  ;

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash && \
  apt-get install -y nodejs

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ARG UID
ARG USERNAME
ENV UID=$UID
ENV USERNAME=$USERNAME
ENV HOME=/home/$USERNAME
RUN useradd --create-home --shell /bin/bash --uid $UID --gid users --groups sudo $USERNAME
USER $USERNAME
WORKDIR $HOME

RUN mkdir $HOME/bin

RUN opam init --disable-sandboxing --auto-setup
RUN opam install -y ocaml-lsp-server

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > /tmp/rustup.sh && \
  sh /tmp/rustup.sh -y

RUN . $HOME/.cargo/env && \
  rustup component add rust-src rust-analyzer && \
  ln -s $(rustup which rust-analyzer) $HOME/bin/

RUN npm install --global typescript-language-server --prefix ~/.local/

RUN rm -f .bashrc .profile && \
  git clone --depth=1 https://github.com/gridbugs/dotfiles .dotfiles && \
  .dotfiles/install.sh
RUN nvim -u .vim/plugins.vim -c PlugInstall -c qa
