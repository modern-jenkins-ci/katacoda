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

## Jenkins master configuration as code

```bash
❯ tree -L 2 build/master
├── Dockerfile
├── init.groovy.d
│   ├── adminuser.groovy
│   ├── buildagent.groovy
│   ├── credentials.groovy
│   ├── csrf.groovy
│   ├── mastersettings.groovy
│   ├── slavemaster.groovy
│   └── zzzgithuborg.groovy
└── plugins.txt
```

By leveraging Jenkins Groovy Hook script processes [https://wiki.jenkins.io/display/JENKINS/Groovy+Hook+Script](https://wiki.jenkins.io/display/JENKINS/Groovy+Hook+Script) we can pre-configure users, build slaves, credentials, etc. all in code. This give us the ability to control all the configuration with code and brings us one step closer to treating the Jenkins infrastructure as cattle not pets.

## Jenkins UI

Navigate to the Jenkins UI here: https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/ to see the fully configured Jenkins instance.
In this incarnation of the Jenkins setup we are not using the  have preconfigured:

`source .seed.env && echo $LOCAL_PASSWORD`{{execute}}

## Logs

Lets look at the master's log file:

`docker-compose logs -f jenkins-master`{{execute}}

## Summary

We created a fully configured Jenkins instance