#!/bin/bash

if [ "$(docker ps -q -f name=$DOCKER_CONTAINER)" ]; then
    docker attach $DOCKER_CONTAINER
elif [ "$(docker ps -aq -f name=$DOCKER_CONTAINER)" ]; then
    docker start -ai $DOCKER_CONTAINER
else
    export USER_ID=$(id -u ${USER})
    export GROUP_ID=$(id -g ${USER})
    docker-compose -f "./compose/docker-compose.yml" -f "./compose/${DOCKER_COMPOSE_FILE}" run --name $DOCKER_CONTAINER $@ $DOCKER_SERVICE
fi

