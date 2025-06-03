#!/bin/bash

mkdir -p slack-archive_USERDATA
docker build -t slack-archive:dev .

if [ -t 1 ]; then
  DOCKER_TTY="-it"
else
  DOCKER_TTY=""
fi

#docker rm -f slack-archiver

docker run --name slack-archiver --mount type=bind,source="$(pwd)"/slack-archive_USERDATA,target=/slack-archive/slack-archive \
  $DOCKER_TTY slack-archive:dev "$@"
