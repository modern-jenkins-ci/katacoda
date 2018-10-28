export JENKINS_SECRETS=/var/jenkins_secrets #this is the path inside the container
export LOCAL_PASSWORD=344827fbdbfb40d5aac067c7a07b9230
export SLAVE_SECRET=
export SECRETS_SEED_URL=https://goo.gl/mJV8wz
export JENKINS_FRONTEND_URL=https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/
export LOAD_LOCAL_SECRETS=false

git clone https://github.com/modern-jenkins-ci/docker-jenkins.git $HOME/docker-jenkins

cd $HOME/docker-jenkins
mkdir -p build/master/secrets
curl -sSL $SECRETS_SEED_URL -o ./build/master/secrets/github

cd $HOME