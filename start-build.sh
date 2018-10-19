#!/bin/bash

set -e

ARG=""
if [[ "$1" == "-d" ]]
then
    ARG="$1"
fi

docker-compose -f docker-compose.build.yaml pull && docker-compose -f docker-compose.build.yaml up --build $ARG
