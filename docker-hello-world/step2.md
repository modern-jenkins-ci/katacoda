Lets run some docker commands to get familar with docker.

## Task

`cd ~/swpc`{{execute}}

`mkdir html`{{execute}}

`echo "Hello from SWPC LITE 2018. This is a docker container with hostname: $(hostname)" > html/index.html`{{execute}}

cat html/index.html

`cat Dockerfile`{{execute}}

`docker build -t swpc:2018 -f Dockerfile .`{{execute}}

`docker run --name swpc-container -p 80:80 swpc:2018`{{execute}}