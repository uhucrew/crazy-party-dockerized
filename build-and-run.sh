#!/bin/sh

docker build . -t crazy-party:latest


docker kill crazy-party
echo y | docker system prune

docker run -dt --restart=always \
    --name crazy-party \
    -p 2500:2500/udp \
    crazy-party:latest
