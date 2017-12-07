.PHONY: logs backup

CONTAINER_NAME=currentdocscms
DATA_CONTAINER_NAME=currentdocscms_data
VOLUME_NAME=currentdocscms_volume_web
BASE_TAG=shaneburkhart/currentdocscms

all: run

run:
	docker volume create ${VOLUME_NAME} || true
	docker run --name ${CONTAINER_NAME} -d -v ${VOLUME_NAME}:/var/www/html -p 80:80 ${BASE_TAG}

stop:
	docker stop ${CONTAINER_NAME} || echo "No container to stop..."

clean: stop
	docker rm ${CONTAINER_NAME} || echo "No container to remove..."

build:
	docker build -t ${BASE_TAG} .

logs:
	docker logs ${CONTAINER_NAME}

c:
	docker run --rm -it -v ${VOLUME_NAME}:/var/www/html ${BASE_TAG} /bin/bash
