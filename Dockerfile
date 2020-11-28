ARG BASE_IMAGE=debian:stretch-slim
FROM ${BASE_IMAGE}


USER root
WORKDIR /root

RUN apt-get update && apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        python3-wrapt \
        sudo \
        patch \
        wget \
        curl \
        ssh \
        ca-certificates \
        git \
        gpg \
        openssh-client \
        iproute2 \
        iputils-ping \
        net-tools \
        tcpdump \
        x11-xserver-utils \
        xterm
RUN  apt-get update && apt-get install -y --no-install-recommends \
        #openvswitch-switch \
        #openvswitch-testcontroller \
        #&& rm /usr/bin/python \
        && ln -s /usr/bin/python3 /usr/bin/python \
        && ln -s /usr/bin/pip3 /usr/bin/pip \
        && mkdir -p /mnscripts
#RUN alias python='/usr/bin/python3' # it does not work, had to do standard symbolic link
        #&& curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
        #&& python get-pip.py \
RUN     git clone git://github.com/mininet/mininet
RUN     sed -i 's/PYTHON ?= python/PYTHON = python3/g' mininet/Makefile
        #&& apt-get install -y --no-install-recommends \
        #python-tk \ #no user interface for now
#COPY Makefile /mnscripts/mininet/
RUN ./mininet/util/install.sh -nfv \
        && rm /usr/bin/python \
        && rm /usr/bin/pip \
        && ln -s /usr/bin/python3 /usr/bin/python \
        && ln -s /usr/bin/pip3 /usr/bin/pip
        #RUN ./mininet/util/install.sh -nfv \
        #&& mkdir -p /mnscripts \
        #&& pip install --upgrade pip setuptools \ #pip install setuptools \
        #&& wget http://bottlepy.org/bottle.py -P /usr/local/bin/ \
        #&& rm -rf /var/lib/apt/lists/*
WORKDIR /mnscripts
EXPOSE 9081
CMD ["sh","start.sh"]
