ARG BASE_IMAGE=debian:stretch-slim
FROM ${BASE_IMAGE}


USER root
WORKDIR /root

#RUN apt-get update && apt-get install -y --no-install-recommends gpg
#RUN echo deb http://linux.dell.com/repo/community/ubuntu xenial openmanage > /etc/apt/sources.list.d/linux.dell.com.sources.list \
#RUN gpg --keyserver hkp://pool.sks-keyservers.net:80 --recv-key 1285491434D8786F
#RUN gpg -a --export 1285491434D8786F > dellkeys
#RUN apt-key add dellkeys
RUN apt-get update && apt-get install -y --no-install-recommends \
        sudo \
        patch \
        git \
        && git clone git://github.com/mininet/mininet \
        && alias python='/usr/bin/python3' \
        && apt-get install -y --no-install-recommends \
        gpg \
        openvswitch-switch \
        openvswitch-testcontroller \
        python-pip \
        python-tk \
        curl \
        ssh \
        openssh-client \
        iproute2 \
        iputils-ping \
#        mininet \
        net-tools \
        tcpdump \
        #vim \
        x11-xserver-utils \
        xterm \
        python3 \
        && ./mininet/util/install.sh -nfv \
        && mkdir -p /mnscripts \
        && pip install setuptools \
        && wget http://bottlepy.org/bottle.py -P /usr/local/bin/ \
        && rm -rf /var/lib/apt/lists/*
WORKDIR /mnscripts
EXPOSE 9081
CMD ["sh","start.sh"]
