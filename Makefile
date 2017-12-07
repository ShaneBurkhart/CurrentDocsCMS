.PHONY: logs backup

CONTAINER_NAME=currentdocscms
DATA_CONTAINER_NAME=currentdocscms_data
VOLUME_NAME=currentdocscms_volume_web
BASE_TAG=shaneburkhart/currentdocscms

all: run

run:
	docker run --name ${DATA_CONTAINER_NAME} -v ${VOLUME_NAME}:/var/www/html ${BASE_TAG} true || true
	docker run --name ${CONTAINER_NAME} -d --volumes-from ${DATA_CONTAINER_NAME} -p 80:80 ${BASE_TAG} || true

stop:
	docker stop ${CONTAINER_NAME} || echo "No container to stop..."

clean: stop
	docker rm ${CONTAINER_NAME} || echo "No container to remove..."

build:
	docker build -t ${BASE_TAG} .

logs:
	docker logs ${CONTAINER_NAME}

c:
	docker run --rm -it --volumes-from ${DATA_CONTAINER_NAME} ${BASE_TAG} /bin/bash
