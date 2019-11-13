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
        #git automake autoconf gcc uml-utilities libtool build-essential git pkg-config linux-headers-4.15.0-1059-oem \
        git \
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
        mininet \
        net-tools \
        tcpdump \
        vim \
        x11-xserver-utils \
        xterm \
        python3 \
        && rm -rf /var/lib/apt/lists/* \
        && mkdir -p /mnscripts \
        && pip install setuptools \
        && pip install bottle
        #&& chmod +x boot.sh \
        #&& ./boot.sh \
        #&& ./configure \
        #&& make && make install
WORKDIR /mnscripts
#EXPOSE 6633 6653 6640 8080
EXPOSE 8080
