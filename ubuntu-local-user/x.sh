#!/bin/sh
set -ex
sh build
docker run --rm -it ubuntu-local-user bash --login
