mkdir /tmp/jenkins

if [ "$ENV" == "HOST1" ]; then
  ssh root@host01 "cat /root/docker-compose-master.yml" > /tmp/jenkins/docker-compose.yml
fi

if [ "$ENV" == "HOST2" ]; then
  ssh root@host02 "cat /root/docker-compose-agent.yml" > /tmp/jenkins/docker-compose.yml
fi

clear; sleep 1