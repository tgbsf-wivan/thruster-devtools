
FROM ubuntu:16.04

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install build-essential clang git make curl bash

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
RUN apt-get install git-lfs

RUN mkdir ~/dev
RUN cd ~/dev && git clone https://github.com/tgbsf-wivan/thruster-devtools.git
RUN cd ~/dev/thruster-devtools && /bin/sh build.sh




