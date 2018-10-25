Protocol One development environment
====================================

This is the repository for the docker-compose files and configs to setup development environment for different cases.

Prerequisites
-------------

P1 services are built with Docker, so you need to have installed and running Docker host. 
If you don't have Docker yet, you can follow these official manuals:

 - Windows: https://docs.docker.com/docker-for-windows/install/
 - Mac: https://docs.docker.com/docker-for-mac/install/
 - Ubuntu: https://docs.docker.com/install/linux/docker-ce/ubuntu/

The P1 services use the following domain names in the development or local test environment:
  
  - admin.protocol.one: P1 admin service
  - api.protocol.one: P1 api service
  - auth.protocol.one: P1 auth service  
  - fs.protocol.one: test launcher updater service  

Insert the following line to the hosts file (usually c:\windows\system32\drivers\etc\hosts for Windows or /etc/hosts for Linux): 

    127.0.0.1 admin.protocol.local api.protocol.local auth.protocol.local fs.protocol.local

Create persistent volumes and network:
  
    docker volume create p1-admin-mongo
    docker volume create p1-auth-mongo
    docker network create p1devnet

Copy file ./etc/.env.example to ./etc/.env and set appropriate values for the environment variables.
P1 Admin service uses Amazon S3 service, so you'll need to set S3 access parameters in the ./etc/.env file.

After initialization of containers services are available by URLs like http://admin.protocol.local:8080

Usage
-----

The file docker-compose.latest.yaml uses pre-built docker images. 
To run all the services:

Windows:    

    start-latest.cmd

Linux:

    ./start-latest.sh

The file docker-compose.build.yaml builds and run docker images for each service. 
If your OS is Windows, you need to share the drive to which you clone P1 repositories in the Docker settings.
First, clone all necessary P1 services repositories to the working directory (to the same parent dir as for devenv), then go to the devenv dir and run:

Windows:    

    start-build.cmd

Linux:

    ./start-build.sh

To start containers in detached mode add "-d" argument to the start script command line.

Updater
-------

If you need to test launcher updater system, put the files to be distributed to the ./updaterfiles directory.
If you need to test launcher updater system only, without other services, you can just run:

    docker-compose -f docker-compose.updater.yaml up

or use start scripts:

Windows:
    
    start-updater.cmd

Linux:
    
    ./start-updater.sh
