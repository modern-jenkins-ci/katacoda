## Orchestration with docker-compose

Lets create some Jenkins containers with docker-compose! For more information on docker-compose click here: [https://docs.docker.com/compose/overview/](https://docs.docker.com/compose/overview/)

In this step we will inspect our docker-compose file and run the docker-compose commands to start our containers.

`mkdir -p /tmp/jenkins/data \
    && cd /tmp/jenkins`{{execute}}

`cat docker-compose.yml`{{execute HOST1}}

Let start up the containers:

`docker-compose up -d`{{execute}}

This will pull the docker images and start up the containers in detached mode `-d` so they will run in the background.

We should have two containers running now. A Jenkins master and a Jenkins build agent. You can see those running containers by running:

`docker ps -a | grep --color -E '^|jenkins'`{{execute}}

## Jenkins User Interface (UI)

Navigate to the Jenkins UI here: https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/ to see the your Jenkins instance. If you still have your data directory you will the Jenkins job page. Otherwise you will see the setup wizard. You can refer to Step 1 to see how to view the `admin` password for the setup wizard.

## Logs with docker-compose

Lets look at the master's log file with docker-compose:

`docker-compose logs -f jenkins-master`{{execute HOST1}}

## Slave setup

`export JOIN_SECRET=`{{copy}}

`docker-compose up -d`{{execute HOST2}}

## Summary

We have fully orchestrated our Jenkins master and build agent docker containers with docker-compose. You can now configure your Jenkins master server.