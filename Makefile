.PHONY: logs

CONTAINER_NAME=currentdocscms
BASE_TAG=shaneburkhart/currentdocscms

all: run

run:
	docker run --name ${CONTAINER_NAME} -d --rm -p 80:80 ${BASE_TAG}

stop:
	docker stop ${CONTAINER_NAME}

build:
	docker build -t ${BASE_TAG} .

logs:
	docker logs ${CONTAINER_NAME}

c:
	docker run --rm -it ${BASE_TAG} /bind/bash
