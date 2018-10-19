#!/bin/bash

set -e

docker-compose -f docker-compose.build.yaml pull && docker-compose -f docker-compose.build.yaml up
