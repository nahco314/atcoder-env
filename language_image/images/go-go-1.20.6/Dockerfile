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

pushd /tmp                                    
wget https://go.dev/dl/go1.20.6.linux-amd64.tar.gz
sudo tar -C /opt -xf go1.20.6.linux-amd64.tar.gz
popd
export PATH=$PATH:/opt/go/bin
# create project and install libraries
go mod init atcoder.jp/golang
go get -u github.com/emirpasic/gods/...
go get -u gonum.org/v1/gonum/...
go get -u github.com/liyue201/gostl/...
go get -u golang.org/x/exp/

EOF



COPY --chmod=777 run.bash /tmp/run.bash
