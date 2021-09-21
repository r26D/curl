#!/bin/bash

#Push to github
docker build -t "ghcr.io/r26d/wait-for-status/wait-for-status:v${1}" .
docker build -t "ghcr.io/r26d/wait-for-status/wait-for-status:latest" .
docker push "ghcr.io/r26d/wait-for-status/wait-for-status:latest"
docker push "ghcr.io/r26d/wait-for-status/wait-for-status:v${1}"

