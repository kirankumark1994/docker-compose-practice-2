#!/bin/bash

set -x

VAR_1=$(sudo docker compose ps --filter status=running | awk 'F " " {print $4}' | sed -n "2p")
VAR_2=$(sudo docker compose ps --filter status=running | awk 'F " " {print $5}'  | sed -n "3p")





if [ $VAR_1 = running ] && [ $VAR_2 = running ]
then
        echo "Deployement is successful"
else
        echo "Deployement is failure"
fi

