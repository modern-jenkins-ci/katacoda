Lets create some Jenkins containers with docker-compose!

docker-compose link: [https://docs.docker.com/compose/overview/](https://docs.docker.com/compose/overview/)

## Orchestration with docker-compose

`git pull https://github.com/modern-jenkins-ci/docker-jenkins.git`{{execute}}

`cp /tmp/seed.env docker-jenkins/.seed.env`{{execute}}

`cd docker-jenkins`{{execute}}

lets look at the jenkins master init.d scripts

`cat docker-compose.yml`

Lets build the images before we startup Jenkins. The docker-compose up command will build the images automatically but we have to ablity to build the images before we start them up.

`docker-compose build`{{execute}}

`./start.sh`{{execute}}

## Jenkins UI

Navigate to the Jenkins UI here: https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/ to see the fully configured Jenkins instance.
In this incarnation of the Jenkins setup we are not using the  have preconfigured:

`source .seed.env && echo $LOCAL_PASSWORD`{{execute}}

## Logs

Lets look at the master's log file:

`docker-compose logs -f jenkins-master`{{execute}}

## Summary

We created a fully configured Jenkins instance