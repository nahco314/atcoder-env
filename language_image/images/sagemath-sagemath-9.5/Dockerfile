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

# インストール中にタイムゾーン選択で固まるのを回避するため。タイムゾーン選択済みの環境なら不要
sudo ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime && echo "Etc/UTC" | sudo tee /etc/timezone
sudo apt update && sudo apt install -y sagemath

EOF



COPY --chmod=777 run.bash /tmp/run.bash
