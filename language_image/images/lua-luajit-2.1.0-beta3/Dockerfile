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
sudo apt install -y make

cd /tmp
curl -R -O https://luajit.org/download/LuaJIT-2.1.0-beta3.tar.gz
tar zxf LuaJIT-2.1.0-beta3.tar.gz
cd LuaJIT-2.1.0-beta3
make
sudo make install
sudo ln -sf luajit-2.1.0-beta3 /usr/local/bin/luajit

EOF



COPY --chmod=777 run.bash /tmp/run.bash
