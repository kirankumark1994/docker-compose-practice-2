#!/bin/bash



VAR_1=$(docker ps -f name=grafana | grep grafana)
VAR_2=$(docker ps -f name=prometheus| grep prometheus)

if [ -z "$VAR_1" ] || [ -z "$VAR_2" ]
then
        echo "deployment is failure"
else
        echo "deployement is success"
fi
