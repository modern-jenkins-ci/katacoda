mkdir -p /tmp/jenkins/data
export JENKINS_MASTER=http://172.17.0.42:8080

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