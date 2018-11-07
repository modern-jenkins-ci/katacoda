mkdir -p /tmp/jenkins/data

if [ "$ENV" == "HOST1" ]; then
  ssh root@host01 "cat /root/docker-compose-master.yml" > /tmp/jenkins/docker-compose.yml
else
  ssh root@host02 "cat /root/docker-compose-agent.yml" > /tmp/jenkins/docker-compose.yml
fi

cd /tmp/jenkins
clear
pwd