#!/usr/bin/env bash

docker run \
    -d \
    --name jenkins-master \
    -p 8080:8080 \
    -p 50000:50000 \
    -v $(which docker):/usr/bin/docker \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /root/workspace \
    jenkins-master &&\
    docker logs -f jenkins-master;
