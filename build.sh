#!/bin/bash
source docker-main/docker-helper-functions.sh
docker-build-image-with-name chazzofalf/with-user-docker-recipe
docker-smart-build-core "$@"
