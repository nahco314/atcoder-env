# syntax=docker/dockerfile:1.4.1

# generated by dockerfile_gen.py

# DOCKER_BUILDKIT=1 docker build ...

FROM ubuntu:23.04

SHELL ["/bin/bash", "-c"]

RUN apt-get update

RUN apt install sudo adduser

RUN adduser runner && \
    echo '%runner ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER runner

RUN sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
ENV DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true

RUN sudo apt install -y wget unzip xz-utils curl

RUN sudo mkdir /judge --mode=777

WORKDIR /judge


RUN <<EOF

sudo apt update
sudo apt install -y libgmp-dev libpcre2-dev git curl
curl -fsSL https://crystal-lang.org/install.sh | sudo bash -s -- --version=1.9
# 以下、project 作成
mkdir main
cd main
crystal init app .
cat >> shard.yml <<_eof_
dependencies:
  atcoder:
    github: google/ac-library.cr
_eof_
# install libraries in the project
shards install --verbose

EOF



COPY --chmod=777 run.bash /tmp/run.bash
