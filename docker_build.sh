#!/bin/bash

#Push to github
docker build -t "ghcr.io/r26d/wait-for-status-action/wait-for-status-action:v${1}" .
docker build -t "ghcr.io/r26d/wait-for-status-action/wait-for-status-action:latest" .
docker push "ghcr.io/r26d/wait-for-status-action/wait-for-status-action:latest"
docker push "ghcr.io/r26d/wait-for-status-action/wait-for-status-action:v${1}"

