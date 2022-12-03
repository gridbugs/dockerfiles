#!/bin/sh
set -ex
pushd ../gridbugs-dev-ubuntu && sh build && popd
pushd ../gridbugs-dev-ubuntu-sel4 && sh build && popd
sh build
docker run --rm -it gridbugs-dev-ubuntu-sel4test bash --login
