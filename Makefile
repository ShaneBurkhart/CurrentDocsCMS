.PHONY: logs

CONTAINER_NAME=currentdocscms
BASE_TAG=shaneburkhart/currentdocscms

all: run

run:
	docker run --name ${CONTAINER_NAME} -d --rm -v $(shell pwd):/var/www/html -p 80:80 ${BASE_TAG}

stop:
	docker stop ${CONTAINER_NAME}

build:
	docker build -t ${BASE_TAG} .

logs:
	docker logs ${CONTAINER_NAME}

c:
	docker run --rm -it -v $(shell pwd):/var/www/html ${BASE_TAG} /bin/bash
