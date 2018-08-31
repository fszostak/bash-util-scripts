#!/bin/bash

INSTANCE="$(docker ps | grep $1 | head -1)"

if [ $? -eq 0 ]; then
   echo $INSTANCE
   docker exec -it $(echo $INSTANCE | cut -f1 -d" ") /bin/bash
fi
