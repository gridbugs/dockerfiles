#!/bin/sh
set -ex
pushd ../gridbugs-dev-ubuntu-osdev && sh build && popd
sh build
docker run --rm -it gridbugs-dev-ubuntu-osdev-cross-compile-to-x86 bash --login
