# Docker

Docker container for WebServerAndClient

## How to build and test the emstrack container

There are two ways to build and test the emstrack container. You can use the `docker` or `docker-compose` (recommended). The latter will take care of mounting volumes, handling options, etc.

### Using docker-compose

Type

    docker-compose build

to build the container. See below for details on the options available. Type

    docker-compose up

to run the container. You can log in a running container using

    docker-compose exec emstrack bash

This will open up a shell session. Once inside the container shell you can, for example, test your application using

    emstrack-test.sh
    
If testing fails on your installation please report. Testing the MQTT functions is tricky and might require tunning some wait times in the test files.
