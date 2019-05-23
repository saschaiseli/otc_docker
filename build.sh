#!/usr/bin/env bash

if [ $1 == 'master' ]
then
    echo "Build JBoss Application Server from Master Branch"
    docker build -t iselisa/wildfly:$2 wildfly/
else
    echo "Build JBoss Application Server from Develop Branch"
    docker build -t iselisa/wildfly:$1-$2 wildfly/
    docker build -t iselisa/wildfly:latest wildfly/
fi
