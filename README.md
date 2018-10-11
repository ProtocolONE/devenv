Protocol One development environment
====================================

This is the repository for the docker-compose files and configs to setup development environment for different cases.

Prerequisites
-------------

insert the following line to the hosts file: 

    127.0.0.1 admin.protocol.local api.protocol.local auth.protocol.local

Usage
-----

The file docker-compose.latest.yaml uses pre-built docker images. 
To run all the services:
    
    copy docker-compose.latest.yaml docker-compose.yaml
    docker-compose up

The file docker-compose.build.yaml builds and run docker images for each service. 
First, clone all services repositories to the working directory, then go to the devenv dir and run:
    
    copy docker-compose.build.yaml docker-compose.yaml
    docker-compose up
