if [ "$ENV" == "HOST1" ]; then
host_commands=(
"mkdir -p /tmp/jenkins/data"
"cp /root/docker-compose-master.yml /tmp/jenkins/docker-compose.yml"
)
  all_commands=$(awk -v sep=' && ' 'BEGIN{ORS=OFS="";for(i=1;i<ARGC;i++){print ARGV[i],ARGC-i-1?sep:""}}' "${host_commands[@]}")

  ssh root@host01 "$all_commands"
  clear
  ssh root@host01
fi

if [ "$ENV" == "HOST2" ]; then
  sleep 1
  export JENKINS_MASTER=http://[[HOST1_IP]]:8080
  mkdir -p /tmp/jenkins/data
  cd /tmp/jenkins
  ssh root@host01 "cat /root/docker-compose-agent.yml" > /tmp/jenkins/docker-compose.yml
  clear
  pwd
fi