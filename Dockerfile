FROM ubuntu:22.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get dist-upgrade -y && apt-get autoremove --purge -y \
 && apt-get install -y \
    nano zstd gawk wget git diffstat unzip texinfo gcc build-essential \
    chrpath socat cpio python3 python3-pip python3-pexpect xz-utils \
    debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa \
    libsdl1.2-dev python3-subunit mesa-common-dev zstd liblz4-tool file locales \
    gcc-multilib \
 && rm -rf /var/lib/apt/lists/*
 
RUN dpkg-reconfigure locales \
 && locale-gen en_US.UTF-8 \
 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LC_ALL   en_US.UTF-8
ENV LANG     en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN wget -O /bin/repo https://storage.googleapis.com/git-repo-downloads/repo
RUN chmod +x /bin/repo

RUN useradd -m user -s /bin/bash

USER user

RUN git config --global user.email "you@example.com"
RUN git config --global user.name "Your Name"
