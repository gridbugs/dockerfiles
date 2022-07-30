# Typical use:
# docker build -f ocaml.dockerfile -t ocaml --build-arg BASE=base
# docker run -it ocaml

ARG BASE
FROM $BASE
RUN sudo apt-get install -y \
    opam
RUN sudo mkdir /opam && sudo chmod a+rwx /opam
ENV OPAMROOT=/opam
RUN opam init --disable-sandboxing --auto-setup
RUN opam install -y utop
