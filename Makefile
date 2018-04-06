include commons.mk

H2_VERSION=2018-03-18

DOCKER_IMAGE_NAME=dockerregistry.pagero.local/h2

build: 
	docker build --build-arg VERSION=$(H2_VERSION) --force-rm=true --no-cache=true -t=$(DOCKER_IMAGE_NAME) .

run:
	DATA_DIR=$(mktemp -d) \
	docker run -v $DATA_DIR:/opt/h2-data -d -p 1521:1521 -p 81:81 --name=h2 h2

show-logs:
	docker logs -f dockerregistry.h2 2>&1

stop:
	docker rm -f h2
