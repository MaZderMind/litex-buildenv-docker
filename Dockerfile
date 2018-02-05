FROM debian:stretch

RUN apt-get update
RUN apt-get install -y python3 git
RUN rm -rf /var/lib/apt/lists/*

COMMAND ['/usr/bin/bash']
