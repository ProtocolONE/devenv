Protocol One development environment
====================================

This is the repository for the docker-compose files and configs to setup development and test environment for different cases.

Prerequisites
-------------

Clone or download and unpack this repository to your local directory:
  
    git clone https://github.com/ProtocolONE/devenv.git && cd devenv

P1 services are built with Docker, so you need to have installed and running Docker host. 
If you don't have Docker yet, you can follow these official manuals:

 - Windows: https://docs.docker.com/docker-for-windows/install/
 - Mac: https://docs.docker.com/docker-for-mac/install/
 - Ubuntu: https://docs.docker.com/install/linux/docker-ce/ubuntu/

To run commands from this manual you need to have **docker-compose**. 
To install **docker-compose** follow the official manual: https://docs.docker.com/compose/install/#install-compose

You'll need a docker ID and password to be able to pull images from the Docker Hub and run required commands, so if you don't have them, you'll need to register at https://hub.docker.com.

The P1 services use the following domain names in the development or local test environment:
  
  - admin.protocol.one: P1 admin service
  - api.protocol.one: P1 api service
  - auth.protocol.one: P1 auth service  
  - fs.protocol.one: test launcher updater service  

Insert the following line to the hosts file (usually c:\windows\system32\drivers\etc\hosts for Windows or /etc/hosts for Linux): 

    127.0.0.1 admin.protocol.local api.protocol.local auth.protocol.local fs.protocol.local

If you want to run the services on a remote machine, set its IP in this line instead of **127.0.0.1**.

Create persistent volumes and network (under Linux the following commands need to be executed with sudo if you are not logged in as root):
  
    docker volume create p1-admin-mongo
    docker volume create p1-auth-mongo
    docker network create p1devnet

Copy file ./etc/.env.example to ./etc/.env and set appropriate values for the environment variables.
P1 Admin service uses Amazon S3 service, so you'll need to set S3 access parameters in the ./etc/.env file.

After initialization of containers (read the **Usage** section) services are available by URLs like http://admin.protocol.local:8080. 
If you run the services on a remote machine, you need to set firewall(s) to allow connections from your machine to the tcp port 8080 on a remote machine.

Usage
-----

The file **docker-compose.latest.yaml** uses pre-built docker images. These images are built automatically and pushed to the Docker Hub by CI/CD pipline. In the current implementation builds are triggered by each commit to the master branches of the services repositories.
To run all the services:

Windows:    

    start-latest.cmd

Linux:

    sudo ./start-latest.sh

The file **docker-compose.build.yaml** builds and run docker images for each service with the services source files, which lets you to alter code and test results localy. 
If your OS is Windows, you need to share the drive to which you clone P1 repositories in the Docker settings.
First, clone all necessary P1 services repositories to the working directory (to the same parent dir as for devenv), then go to the devenv dir and run:

Windows:    

    start-build.cmd

Linux:

    sudo ./start-build.sh

To start containers in detached mode add **-d** argument to the start script command line.

Updater
-------

If you need to test launcher updater system, put the files to be distributed to the ./updaterfiles directory.
If you need to test launcher updater system only, without other services, you can just run:

    docker-compose -f docker-compose.updater.yaml up

or use start scripts:

Windows:
    
    start-updater.cmd

Linux:
    
    sudo ./start-updater.sh

For uploads this updater environment by default uses FTP server with user **ftpuser** and password **ftppass**, which are configured in the environment section of the **docker-compose.updater.yaml** file.
