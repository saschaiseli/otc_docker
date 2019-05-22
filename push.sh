#!/usr/bin/env bash

echo "Push Docker Image to DockerHub"
docker push iselisa/wildfly:$1 --username $2 --password $3