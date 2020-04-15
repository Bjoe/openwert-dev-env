#!/bin/bash

if [ "$(docker ps -q -f name=$DOCKER_CONTAINER)" ]; then
    set -x
    docker attach $DOCKER_CONTAINER
elif [ "$(docker ps -aq -f name=$DOCKER_CONTAINER)" ]; then
    set -x
    docker start -ai $DOCKER_CONTAINER
else
    if [ -n "$DOCKER_COMPOSE_FILE" ]; then
        PARAMETER="-f ./compose/${DOCKER_COMPOSE_FILE}"
    fi
    export USER_ID=$(id -u ${USER})
    export GROUP_ID=$(id -g ${USER})
    set -x
    docker-compose -f "./compose/docker-compose.yml" $PARAMETER run --name $DOCKER_CONTAINER $@ $DOCKER_SERVICE
fi

