Protocol One development environment
====================================

This is the repository for the docker-compose files and configs to setup development environment for different cases.

Prerequisites
-------------

Insert the following line to the hosts file: 

    127.0.0.1 admin.protocol.local api.protocol.local auth.protocol.local

Create persistent volumes and network:
  
    docker volume create p1-admin-mongo
    docker volume create p1-auth-mongo
    docker network create p1devnet

Copy file ./etc/.env.example to ./etc/.env and set appropriate values for the environment variables.

Usage
-----

The file docker-compose.latest.yaml uses pre-built docker images. 
To run all the services:
windows:    
    start-latest.cmd
Linux:
    ./start-latest.sh

The file docker-compose.build.yaml builds and run docker images for each service. 
First, clone all necessary P1 services repositories to the working directory, then go to the devenv dir and run:
windows:    
    start-build.cmd
Linux:
    ./start-latest.sh

To start containers in detached mode add "-d" argument to the start script command line.

After initialization of containers services are available by URLs like http://admin.protocol.local:8080