Lets run some docker commands to get familar with docker.

## Task

First, lets pull an example docker image:

[https://github.com/docker-library/hello-world](https://github.com/docker-library/hello-world)

`docker pull hello-world:latest`{{execute}}

Equvilant command:

`docker pull docker.io/hello-world:latest`{{execute}}

`docker images`{{execute}}

Next lets run that docker image and remove the container once it exits
`docker run hello-world:latest`{{execute}}

`docker ps`{{execute}}

Where is it? We should have a container. Well the `docker ps` command defaults to showing just running containers. So we need the -a flag:

`docker ps -a`{{execute}}

Next let's build a custom docker image and run it.