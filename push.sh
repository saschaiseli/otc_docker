#!/usr/bin/env bash

echo "Push Docker Image to DockerHub"
docker login  --username $2 --password $3
docker push iselisa/wildfly:$1