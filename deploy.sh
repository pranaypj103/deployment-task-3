#!/bin/bash

CONTAINER_NAME="tomcat_container"
IMAGE_NAME="pranaypj1o3/deployment_task_3_2"
PORT_MAPPING="1234:8080"
DOCKER_USER="pranaypj1o3"
DOCKER_REPO="deployment_task_3_2"

echo "Deleting all Docker images..."
docker rmi -f $(docker images -q)

echo "Checking for existing container with the name '$CONTAINER_NAME'..."
EXISTING_CONTAINER=$(docker ps -a -q --filter "name=$CONTAINER_NAME")
if [ ! -z "$EXISTING_CONTAINER" ]; then
    echo "Stopping and removing existing container '$CONTAINER_NAME'..."
    docker rm -f $CONTAINER_NAME
else
    echo "No existing container found with the name '$CONTAINER_NAME'."
fi

echo "Pulling Docker image '$DOCKER_USER/$DOCKER_REPO:latest' from DockerHub..."
docker run -it -d -p $PORT_MAPPING --name $CONTAINER_NAME $DOCKER_USER/$DOCKER_REPO:latest

if [ $? -eq 0 ]; then
    echo "Container '$CONTAINER_NAME' is now running."
else
    echo "Failed to run the container. Please check the Docker logs for more details."
fi
