# Typical use:
# docker build -f ocaml-5.0.0~alpha0.dockerfile -t ocaml5 --build-arg BASE=ocaml
# docker run -it ocaml5

ARG BASE
FROM $BASE
RUN opam switch create 5.0.0~alpha0
RUN opam install -y utop
