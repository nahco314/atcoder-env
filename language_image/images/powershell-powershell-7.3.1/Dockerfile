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

cd /tmp

sudo apt install -y unzip
wget https://github.com/kzrnm/ac-library-csharp/releases/download/v3.0.0-atcoder8/ac-library-csharp.3.0.0-atcoder8.nupkg
unzip ac-library-csharp.3.0.0-atcoder8.nupkg
mv lib/net7.0/ac-library-csharp.dll /judge/

mkdir $HOME/.powershell
wget https://github.com/PowerShell/PowerShell/releases/download/v7.3.1/powershell-7.3.1-linux-x64.tar.gz
tar xvzf powershell-7.3.1-linux-x64.tar.gz -C $HOME/.powershell

sudo ln -s $HOME/.powershell/pwsh /usr/local/bin/pwsh

EOF



COPY --chmod=777 run.bash /tmp/run.bash
