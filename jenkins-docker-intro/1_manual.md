## Manual container orchestration

Lets create some Jenkins containers!

![](http://www.scmgalaxy.com/tutorials/wp-content/uploads/2018/05/jenkins-architecture-master-slave.jpg)

In this step we will pull the Jenkins images and run them manually. The Dockerfile for the Jenkins master image can be found here: [https://github.com/jenkinsci/docker/blob/master/Dockerfile-alpine](https://github.com/jenkinsci/docker/blob/master/Dockerfile-alpine)

`docker pull jenkins/jenkins:lts-alpine`{{execute HOST1}}

`mkdir -p /tmp/jenkins/data \
    && cd /tmp/jenkins`{{execute}}

`docker run -d \
    --name jenkins-master \
    -u root \
    -v /tmp/jenkins/data/jenkins-master:/var/jenkins_home \
    -p 8080:8080 -p 50000:50000 \
    jenkins/jenkins:lts-alpine`{{execute HOST1}}

## Check the Running Container

Lets take a look at the running containers:

`docker ps -a | grep --color -E '^|jenkins/jenkins:lts-alpine'`{{execute HOST1}}

We can even look at the logs of our Jenkins master:

`docker logs -f jenkins-master`{{execute HOST1}}

Exit the log tail by typing `^C`

## Jenkins User Interface (UI)

Navigate to the Jenkins UI here: https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/ to see the setup wizard. By default the Jenkins docker image creates an `admin` user to do the initial configuration of your Jenkins server. The password can be found inside the container. To display that password run the following command:

`docker exec -t jenkins-master cat /var/jenkins_home/secrets/initialAdminPassword`{{execute HOST1}}

If we wanted to start up a Jenkins agent, we could run the following command:

`docker run -d \
    --name jenkins-agent \
    -u root \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /tmp/jenkins/data/jenkins-agent:/home/jenkins/ci-agent \
    jenkins/slave:alpine \
    java -jar /usr/share/jenkins/slave.jar -jnlpUrl http://[[HOST1_IP]]:8080/computer/docker-agent/slave-agent.jnlp -secret "changeme" -workDir "/home/jenkins/ci-agent"`{{copy}}

## Cleanup
`docker stop jenkins-master && docker rm jenkins-master`{{execute HOST1}}

`docker stop jenkins-agent && docker rm jenkins-agent`{{execute HOST2}}

`docker ps -a`{{execute}}

## Summary

So far we have manually created two containers using the `docker run` command, next we will use docker-compose to defined the desired state of our docker containers and let it manged pulling and running the containers.