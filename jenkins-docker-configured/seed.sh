export JAVA_OPTS=-Djenkins.install.runSetupWizard=false
export JENKINS_SECRETS=/var/jenkins_secrets #this is the path inside the container
export LOCAL_PASSWORD=344827fbdbfb40d5aac067c7a07b9230
export JOIN_SECRET=
export SECRETS_SEED_URL=https://goo.gl/mJV8wz
export JENKINS_FRONTEND_URL=https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/
export LOAD_LOCAL_SECRETS=false
export JENKINS_SERVER=[[HOST_IP]]

export GITHUB_SETUP_API_URL=https://api.github.com
export GITHUB_SETUP_CREDENTIAL_ID=swpc-2018-pat
export GITHUB_SETUP_WEBHOOK_CREDENTIAL_ID=swpc-2018-pat-text
export GITHUB_SETUP_ORG_NAME=modern-jenkins-ci
export GITHUB_SETUP_ORG_DISPLAY_NAME=Modern-Jenkins

git clone https://github.com/modern-jenkins-ci/docker-jenkins.git $HOME/docker-jenkins

cd $HOME/docker-jenkins
sed -i 's/dockerfile: Dockerfile/dockerfile: Dockerfile.secrets/g' docker-compose.yml
grep -v "/var/jenkins_secrets" docker-compose.yml
mkdir -p build/master/secrets
curl -sSL $SECRETS_SEED_URL -o ./build/master/secrets/local_secrets

cd $HOME
clear
pwd
