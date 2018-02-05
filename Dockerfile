FROM debian:stretch

RUN apt-get update
RUN apt-get install -y python3 git wget nano vim build-essential gdb gnupg \
  libreadline-dev libusb-1.0-0-dev libftdi-dev fxload \
  atftpd libsdl1.2-dev

RUN rm -rf /var/lib/apt/lists/*

CMD ['/bin/bash']
