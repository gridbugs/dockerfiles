#!/bin/sh
set -eux

docker build -f ubuntu.dockerfile -t base --build-arg UID=$(id -u) --build-arg USERNAME=$(whoami) .
docker build -f ocaml.dockerfile -t ocaml --build-arg BASE=base .
docker build -f ocaml-5.0.0~alpha0.dockerfile -t ocaml5 --build-arg BASE=ocaml .
