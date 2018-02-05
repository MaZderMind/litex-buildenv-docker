FROM debian:stretch

RUN apt-get update
RUN apt-get install -y python3 git wget nano vim gnupg \
  build-essential gdb \
  libreadline-dev libusb-1.0-0-dev libftdi-dev fxload \
  atftpd libsdl1.2-dev

RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/conda && \
  wget --no-verbose --continue https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
  sh Miniconda3-latest-Linux-x86_64.sh -p /usr/conda -b -f && \
  rm Miniconda3-latest-Linux-x86_64.sh

ENV PATH="/usr/conda/bin:${PATH}"
RUN conda config --system --set always_yes yes && \
  conda config --system --set changeps1 no && \
  conda config --system --add envs_dirs $CONDA_DIR/envs && \
  conda config --system --add pkgs_dirs $CONDA_DIR/pkgs && \
  conda config --system --add channels timvideos && \
  conda update -q conda && \
  conda info

RUN conda install -y binutils-lm32-elf=2.28 && \
  conda install -y gcc-lm32-elf-nostdc=5.4.0

CMD '/bin/bash'
