FROM phusion/baseimage:latest
LABEL MAINTAINER="howpwn"

RUN dpkg --add-architecture i386 && \
    apt-get -y update && \
    libc6:i386 \
    libc6-dbg:i386 \
    libc6-dbg \
    lib32stdc++6 \
    g++-multilib \
    cmake \
    ipython \
    neovim \
    net-tools \
    libffi-dev \
    libssl-dev \
    python-dev \
    build-essential \
    tmux \
    strace \
    ltrace \
    nasm \
    wget \
    gdb \
    gdb-multiarch \
    netcat \
    git \
    ruby2.3 \
    rm -rf /var/lib/apt/list/*

# pip
RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

# capstone: ropgadget dependency
RUN python3 -m pip install -U pip && \
    python3 -m pip install --no-cache-dir \
    capstone \

# ropgadget, pwntools
RUN pip install --upgrade setuptools && \
    pip install --no-cache-dir \
    ropgadget \
    pwntools && \
    pip install --upgrade pwntools

# one_gadget
RUN gem install one_gadget && rm -rf /var/lib/gems/2.3.*/cache/*

# pwndbg
RUN git clone https://github.com/pwndbg/pwndbg && \
    cd pwndbg && chmod +x setup.sh && ./setup.sh

# Pwngdb
RUN git clone https://github.com/scwuaptx/Pwngdb.git /root/Pwngdb && \
    cd /root/Pwngdb && cat /root/Pwngdb/.gdbinit  >> /root/.gdbinit && \
    sed -i "s?source ~/peda/peda.py?# source ~/peda/peda.py?g" /root/.gdbinit

WORKDIR /ctf/

ENTRYPOINT ["/bin/bash"]