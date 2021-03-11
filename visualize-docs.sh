#!/bin/bash

CONTAINER_NAME="do550-docs"
IMAGE="docker.io/littlstar/docker-docsify"

EXIST=$(podman ps -a --filter name="${CONTAINER_NAME}" --format "{{ .Names }}")

if [[ "${EXIST}" == "${CONTAINER_NAME}" ]]
then

  podman stop "${CONTAINER_NAME}"

  podman start "${CONTAINER_NAME}"

else

  podman run --name "${CONTAINER_NAME}" -d -p 3000:3000 -v "./exercises:/usr/local/docsify":Z "${IMAGE}"

fi
