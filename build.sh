#!/bin/bash
source ~/docker/docker-helper-functions.sh
docker-build-image-with-name chazzofalf/with-user-docker-recipe
docker-smart-build-core "$@"
