if [ "$ENV" == "HOST1" ]; then
host_commands=(
"mkdir -p /jenkins/data"
"cp /root/docker-compose-master.yml /jenkins/docker-compose.yml"
)
  all_commands=$(awk -v sep=' && ' 'BEGIN{ORS=OFS="";for(i=1;i<ARGC;i++){print ARGV[i],ARGC-i-1?sep:""}}' "${host_commands[@]}")

  ssh root@host01 "$all_commands"
  clear
  ssh root@host01
fi

if [ "$ENV" == "HOST2" ]; then
  sleep 1
  export JENKINS_MASTER=http://[[HOST1_IP]]:8080
  mkdir -p /jenkins/data
  cd /jenkins
  ssh root@host01 "cat /root/docker-compose-agent.yml" > /jenkins/docker-compose.yml
  ssh root@host01 "cat /root/Dockerfile.agent" > /jenkins/Dockerfile.agent
  clear
  pwd
fi