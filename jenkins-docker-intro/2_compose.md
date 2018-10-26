Lets create some Jenkins containers with docker-compose!

docker-compose link: [https://docs.docker.com/compose/overview/](https://docs.docker.com/compose/overview/)

## Orchestration with docker-compose

In this step we will inspect our docker-compose file and run the docker-compose commands to start our containers.

`mkdir -p /tmp/jenkins/data \
    && cd /tmp/jenkins`{{execute}}

`cat docker-compose.yml`{{execute}}

Let start up the containers:

`docker-compose up -d`{{execute}}

This will start up the containers in detached mode so they will run in the background.

## Jenkins UI

Navigate to the Jenkins UI here: https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/ to see the setup wizard. By default the Jenkins docker image creates an `admin` user to do the initial configuration of your Jenkins server. The password can be found inside the container. To display that password run the following command:

`docker exec -t jenkins-master cat /var/jenkins_home/secrets/initialAdminPassword`{{execute}}

## Logs

Lets look at the master's log file:

`docker-compose logs -f jenkins-master`

## Summary

So far we have manually created two containers using the `docker run` command, next we will use docker-compose to defined the desired state of our docker containers and let it manged pulling and running the containers.