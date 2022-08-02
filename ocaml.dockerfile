# Typical use:
# docker build -f ocaml.dockerfile -t ocaml --build-arg BASE=base .
# docker run -it ocaml

ARG BASE
FROM $BASE
RUN sudo apt-get install -y \
    opam \
    ocaml-odoc \
    nodejs \
    coq \
    libgmp-dev
RUN sudo mkdir /opam && sudo chmod a+rwx /opam
ENV OPAMROOT=/opam
RUN opam init --disable-sandboxing --auto-setup

# Handy tools and libraries
RUN opam install -y base core utop ocaml-lsp-server ocamlformat

# Deps for working on dune
RUN opam install -y core_bench ctypes cinaps mdx coq js_of_ocaml
