FROM phusion/baseimage:latest
LABEL MAINTAINER="howpwn"

RUN dpkg --add-architecture i386 && \
    apt-get -y update && \
    apt install -y \
    libc6:i386 \
    libc6-dbg:i386 \
    libc6-dbg \
    lib32stdc++6 \
    g++-multilib \
    cmake \
    ipython \
    vim \
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
    nmap \
    git \
    ruby2.3 && \
    rm -rf /var/lib/apt/list/*

# pip
RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

# capstone: ropgadget dependency
RUN python3 -m pip install -U pip && \
    python3 -m pip install --no-cache-dir \
    capstone

# ropgadget, pwntools
RUN pip install --upgrade setuptools && \
    pip install --no-cache-dir \
    ropgadget \
    pwntools && \
    pip install --upgrade pwntools

# one_gadget
RUN gem install one_gadget && rm -rf /var/lib/gems/2.3.*/cache/*

# PEDA
RUN git clone https://github.com/scwuaptx/peda.git /root/peda && \
    cp /root/peda/.inputrc /root/ && \
    sed -i 's/"autosave"  : ("on", "auto saving peda session, e.g: on|off"),/"autosave"  : ("off", "auto saving peda session, e.g: on|off"),/g' /root/peda/lib/config.py

# Pwngdb
RUN git clone https://github.com/scwuaptx/Pwngdb.git /root/Pwngdb && \
    cp root/Pwngdb/.gdbinit /root/

# rcFile
RUN wget https://raw.githubusercontent.com/finn79426/Pwn-Box/master/.bashrc -O ~/.bashrc

WORKDIR /box/

ENTRYPOINT ["/bin/bash"]