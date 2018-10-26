Lets create some Jenkins containers!

## Manual container orchestration

![](http://www.scmgalaxy.com/tutorials/wp-content/uploads/2018/05/jenkins-architecture-master-slave.jpg)

In this step we will pull the Jenkins images and run them manually

`docker pull jenkins/jenkins:lts-alpine`{{execute}}
`docker pull jenkins/slave:alpine`{{execute}}

`mkdir data`{{execute}}

`docker run -d \
    --name jenkins-master \
    -v $PWD/data/jenkins-master:/var/jenkins_home \
    -p 8080:8080 -p 50000:50000 \
    jenkins/jenkins:lts-alpine`{{execute}}

`docker run -d \
    --name jenkins-slave \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $PWD/data/jenkins-slave:/home/jenkins/ci-agent \
    jenkins/jenkins:lts-alpine \
    java -jar /usr/share/jenkins/slave.jar -jnlpUrl http://jenkins-master:8080/computer/docker-slave/slave-agent.jnlp -secret "xxx" -workDir "/home/jenkins/ci-agent"`{{execute}}

## UI

Navigate to the Jenkins UI here: [https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/](https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/) to see the setup wizard. By default the Jenkins docker image creates an `admin` user to do the initial configuration of your Jenkins server. The password can be found inside the container. To display that password run the following command:

`docker exec -t jenkins-master cat /var/jenkins_home/secrets/initialAdminPassword`{{execute}}

## Cleanup
`docker stop jenkins-master && docker rm jenkins-master`{{execute}}
`docker stop jenkins-slave && docker rm jenkins-slave`{{execute}}

## Summary

So far we have manually created two containers using the `docker run` command, next we will use docker-compose to defined the desired state of our docker containers and let it manged pulling and running the containers.