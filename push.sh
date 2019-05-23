#!/usr/bin/env bash

echo "Push Docker Image to DockerHub "
echo "------------------------------"
docker login  --username $3 --password $4
echo "------------------------------"



if [ $1 == 'master' ]
then
    echo "Push Master Branch Image"
    docker push iselisa/wildfly:$2
else
    echo "Push Develop Branch Images"
    docker push iselisa/wildfly:$1-$2
    docker push iselisa/wildfly:latest
fi