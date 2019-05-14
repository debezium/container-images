#!/bin/bash

##
## Lints all Dockerfiles with Hadolint
##
docker run --rm -i -v "$(pwd)":/p --workdir=/p \
  hadolint/hadolint:latest-debian \
  hadolint ./*/*/Dockerfile
