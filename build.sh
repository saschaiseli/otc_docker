#!/usr/bin/env bash

echo "Build JBoss Application Server"

docker build -t iselisa/wildfly:$1 wildfly/