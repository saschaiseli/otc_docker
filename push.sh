#!/usr/bin/env bash

echo "Push Docker Image to DockerHub " $2 $3
docker info
echo "------------------------------"
docker login  --username $2 --password $3
echo "------------------------------"
docker info
docker push iselisa/wildfly:$1