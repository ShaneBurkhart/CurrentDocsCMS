.PHONY: logs backup

CONTAINER_NAME=currentdocscms
VOLUME_NAME=currentdocscms_volume_web
BASE_TAG=shaneburkhart/currentdocscms

all: run

run:
	docker run --name ${CONTAINER_NAME} -d -v ${VOLUME_NAME}:/var/www/html -p 80:80 ${BASE_TAG}

stop:
	docker stop ${CONTAINER_NAME}

clean: stop
	docker rm $(docker ps -q)

build:
	docker build -t ${BASE_TAG} .

logs:
	docker logs ${CONTAINER_NAME}

c:
	docker run --rm -it --volumes-from ${CONTAINER_NAME} ${BASE_TAG} /bin/bash

backup:
	docker run --volumes-from ${CONTAINER_NAME}:ro -v $(shell pwd)/backup:/backup ${BASE_TAG} cp -r /var/www/html /backup
