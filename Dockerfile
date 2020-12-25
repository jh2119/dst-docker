FROM ubuntu:latest

MAINTAINER John Hall <me@johnhall.us>

ARG PUID=1000

ENV SHARD Master
ENV CLUSTER dst-docker

RUN dpkg --add-architecture i386
RUN apt update
RUN apt install -y wget lib32stdc++6 lib32gcc1 libcurl4-gnutls-dev:i386

RUN useradd -u $PUID -m steam
RUN mkdir -p /home/steam/steamcmd
RUN wget -qO- https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar xvz -C /home/steam/steamcmd

RUN apt purge -y wget
RUN apt clean autoclean
RUN apt clean 
RUN apt autoremove -y
RUN rm -rf /var/lib/apt/lists/*

COPY ["scripts/run_dedicated_server.sh", "/home/steam"]
RUN chmod +x /home/steam/run_dedicated_server.sh
RUN mkdir -p ~/.klei/DoNotStarveTogether
RUN chown steam:steam -R /home/steam/

USER steam
WORKDIR /home/steam
RUN /home/steam/steamcmd/steamcmd.sh +force_install_dir "/home/steam/dontstarvetogether_dedicated_server" +login anonymous +app_update 343050 validate +quit


ENTRYPOINT ["/home/steam/run_dedicated_server.sh"]