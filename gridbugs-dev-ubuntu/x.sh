#!/bin/sh
set -ex
sh build
docker run --rm -it gridbugs-dev-ubuntu bash --login
