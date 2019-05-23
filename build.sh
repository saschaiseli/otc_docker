#!/usr/bin/env bash

echo "Build JBoss Application Server "$2 $3
docker build -t iselisa/wildfly:$1 wildfly/