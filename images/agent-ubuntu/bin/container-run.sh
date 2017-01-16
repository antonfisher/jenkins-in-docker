#!/usr/bin/env bash

docker run \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --name jenkins-agent-ubuntu \
    jenkins-agent-ubuntu;
