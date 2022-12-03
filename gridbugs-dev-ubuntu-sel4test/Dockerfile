FROM gridbugs-dev-ubuntu-sel4

RUN mkdir seL4test
WORKDIR seL4test
RUN . ~/.profile && repo init -u https://github.com/seL4/sel4test-manifest.git && repo sync

RUN . ~/.profile && mkdir build && cd build && ../init-build.sh -DPLATFORM=x86_64 -DSIMULATION=TRUE && ninja
