FROM atong01/rpi-trst-base:latest

MAINTAINER Alexander Tong <alexanderytong@gmail.com>

WORKDIR /root
RUN             apt-get update && apt-get install -y \
                    ca-certificates \
                    git \
                    vim

COPY            vimrc /root/.vimrc

RUN             apt-get -y autoremove
RUN             rm -rf /var/lib/apt/lists/*

ENTRYPOINT      ["/bin/bash"]
