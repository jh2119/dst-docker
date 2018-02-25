FROM i386/ubuntu:xenial

RUN apt-get update \
    && apt-get install -y wget libcurl3-gnutls:i386 \
    && dpkg --add-architecture i386 \
    && useradd --no-log-init -r  dst \
    && mkdir -p /srv/dst/server \
    && mkdir -p /srv/dst/data \
    && mkdir -p /srv/dst/scripts \
    && wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
    && tar -xvzf steamcmd_linux.tar.gz -C /srv/dst/

COPY scripts/ /srv/dst/scripts

RUN chown dst:dst -R /srv/dst

USER dst

WORKDIR /srv/dst/

RUN ./steamcmd.sh +runscript ./scripts/update_dst_ds.txt


#RUN bash ./scripts/overworld_start.sh \
#    && bash ./scripts/underworld_start.sh
