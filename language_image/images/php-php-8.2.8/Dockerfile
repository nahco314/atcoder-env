# syntax=docker/dockerfile:1.4.1

# generated by dockerfile_gen.py

# DOCKER_BUILDKIT=1 docker build ...

FROM ubuntu:22.04

SHELL ["/bin/bash", "-c"]

RUN apt-get update

RUN apt install -y sudo adduser

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
# add-apt-repositoryが無ければ
sudo apt -y install software-properties-common
sudo add-apt-repository -y ppa:ondrej/php
sudo sed -i -e 's/kinetic/jammy/' /etc/apt/sources.list.d/ondrej-ubuntu-php-kinetic.list
sudo apt update
DEBIAN_FRONTEND=noninteractive sudo -E apt install -y php8.2-cli php8.2-gmp php8.2-bcmath php8.2-sqlite3
echo "opcache.enable_cli = 1
opcache.jit = 1205
opcache.jit_buffer_size = 128M
" | sudo tee -a /etc/php/8.2/cli/conf.d/10-opcache.ini


EOF



COPY --chmod=777 run.bash /tmp/run.bash
