SHELL=/bin/bash -o pipefail -o errexit
TAG ?= $(shell cat TAG)
GOLANG_VERSION ?= $(shell cat GOLANG_VERSION)
IMAGE=ghcr.io/kuoss/go-grpc-greeter-server:$(TAG)

update:
	rm -rf ingress-nginx
	git clone --depth=1 https://github.com/kubernetes/ingress-nginx.git
	cp ingress-nginx/GOLANG_VERSION .
	cp ingress-nginx/images/go-grpc-greeter-server/TAG .
	cp ingress-nginx/images/go-grpc-greeter-server/rootfs/Dockerfile .
	cp ingress-nginx/images/go-grpc-greeter-server/rootfs/main.go .

build:
	docker build --build-arg GOLANG_VERSION=$(GOLANG_VERSION) -t $(IMAGE) .
	docker push $(IMAGE)
