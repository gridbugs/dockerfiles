#!/bin/sh
set -ex
pushd ../gridbugs-dev-ubuntu && sh build && popd
sh build
docker run --rm -it gridbugs-dev-ubuntu-osdev bash --login
