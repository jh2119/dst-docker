FROM ubuntu:xenial

MAINTAINER John Hall <me@johnhall.us>

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y wget lib32gcc1 lib32stdc++6 libcurl4-gnutls-dev:i386 \
    && apt-get clean \
    && useradd -ms /bin/bash dst 

RUN mkdir -p /home/dst/.klei/DoNotStarveTogether \
    && chown dst:dst -R /home/dst/.klei/

USER dst
WORKDIR /home/dst

COPY ["scripts/", "/home/dst"]

RUN wget -qO- https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar xvz -C /home/dst \
    && mkdir server \
    && ./steamcmd.sh +runscript ./update_dst_ds.txt

ENV SHARD Master

ENV CLUSTER DST01

ENTRYPOINT ["/home/dst/start-server.sh"]
#ENTRYPOINT ["/bin/bash"]
