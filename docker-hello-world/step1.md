Let's run some docker commands to get familiar with docker.

## Task

First, lets pull an example docker image:

[https://github.com/docker-library/hello-world](https://github.com/docker-library/hello-world)

`docker pull hello-world:latest`{{execute}}

Equivalent command:

`docker pull docker.io/hello-world:latest`{{execute}}

Let's take a look at our docker images:

`docker images`{{execute}}

Next lets run that docker image:

`docker run hello-world:latest`{{execute}}

The `docker ps` command will let us see our container:

`docker ps`{{execute}}

Where is it? We should have a container. Well, the `docker ps` command defaults to showing just running containers. So we need the -a flag:

`docker ps -a`{{execute}}

That's it for the first step, next let's build a custom docker image and run it.