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

curl -sLO https://raw.githubusercontent.com/babashka/babashka/master/install
chmod +x install
sudo ./install --version 1.3.181
rm install

EOF



COPY --chmod=777 run.bash /tmp/run.bash
