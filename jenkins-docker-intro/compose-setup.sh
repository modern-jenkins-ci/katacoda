mkdir -p /tmp/jenkins/data
export JENKINS_MASTER=https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com

if [ "$ENV" == "HOST1" ]; then
  ssh root@host01 "cat /root/docker-compose-master.yml" > /tmp/jenkins/docker-compose.yml
  cd /tmp/jenkins
  clear
  pwd
fi

if [ "$ENV" == "HOST2" ]; then
  ssh root@host01 "cat /root/docker-compose-agent.yml" > /tmp/jenkins/docker-compose.yml
  cd /tmp/jenkins
  clear
  pwd
fi