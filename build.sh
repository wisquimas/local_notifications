#!/usr/bin/env bash

UID_docker="$(id -u)"
GID_docker="$(id -g)"

docker build -t wisquimas/local_pipe . \
    --build-arg UID=${UID_docker} \
    --build-arg GID=${GID_docker}

./run.sh