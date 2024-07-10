#!/bin/sh
set -ex
sh build
docker run --rm -it -v ~/.ssh:/home/$(whoami)/.ssh:ro gridbugs-dev-ubuntu bash --login
