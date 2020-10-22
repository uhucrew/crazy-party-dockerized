FROM ubuntu:20.04

WORKDIR /opt

ENV DEBIAN_FRONTEND='noninteractive'
RUN apt update \
    && dpkg --add-architecture i386 \
    && apt update \
    && apt -y install wine wine32 winetricks curl unzip \
    || true
RUN wine wineboot \
    && curl http://pragmapragma.free.fr/crazy-party/Crazy-Party-beta73.zip -o Crazy-Party-beta73.zip \
    && unzip Crazy-Party-beta73.zip \
    && rm Crazy-Party-beta73.zip


WORKDIR /opt/Crazy-Party-beta73

EXPOSE 2500/udp

CMD wine server.exe cpdocker 2500 -l Deutsch -p public
