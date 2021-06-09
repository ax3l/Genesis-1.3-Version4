FROM ubuntu:20.04
LABEL genesis_git_repo="https://github.com/svenreiche/Genesis-1.3-Version4"
LABEL genesis_git_sha="61d6c72ad36a45302a66e15b42d48fcf221b1002"

# docker and image environment
ENV        DEBIAN_FRONTEND=noninteractive \
           FORCE_UNSAFE_CONFIGURE=1

RUN        apt-get update && \
           apt-get install -y --no-install-recommends \
              autoconf \
              build-essential \
              ca-certificates \
              coreutils \
              curl \
              g++ \
              git \
              libfftw3-dev \
              libhdf5-openmpi-dev \
              libopenmpi-dev \
              nano \
              openmpi-common \
              openssh-client \
              pkg-config \
              time \
              unzip \
              vim && \
           rm -rf /var/lib/apt/lists/*

ADD . /usr/local/genesis

RUN cd /usr/local/genesis && \
    make && \
    ln -s /usr/local/genesis/gencore /usr/local/bin/gencore

WORKDIR /tmp
ENTRYPOINT ["gencore"] 
#CMD ["-h"]


