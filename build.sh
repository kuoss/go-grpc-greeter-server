.DEFAULT_GOAL:=build

# set default shell
SHELL=/bin/bash -o pipefail -o errexit


#!/bin/bash
set -euxo pipefail

IMAGE=ghcr.io/kuoss/go-grpc-greeter-server:$(cat TAG)

docker build -e GOLANG_VERSION=1.21.6 -t $IMAGE .
docker push $IMAGE
