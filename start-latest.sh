#!/bin/bash

set -e

docker-compose -f docker-compose.latest.yaml pull && docker-compose -f docker-compose.latest.yaml up
