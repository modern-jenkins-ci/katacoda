We will now build a custom docker image to serve a custom web page.

## Task

### The Dockerfile

Let's take a look at the `Dockerfile` we will use to build our docker image.

`cd ~/swpc`{{execute}}

`cat Dockerfile`{{execute}}

### Create HTML

`mkdir html`{{execute}}

`echo "Hello from SWPC LITE 2018. Today is <strong>$(date '+%D')</strong>. This is a docker container with hostname: <strong>$(hostname)</strong>" > html/index.html`{{execute}}

`cat html/index.html`{{execute}}

### Build the Image

`docker build -t swpc:2018 -f Dockerfile .`{{execute}}

We created the docker image and tagged it with `-t swpc:2018`. Let's look at our docker images now:

`docker images`{{execute}}

Now we can run our custom image:

`docker run -d --name swpc-container -p 80:80 swpc:2018`{{execute}}

And now we have a running container:

`docker ps`{{execute}}

We can view the logs of the container by running:

`docker logs -f swpc-container`{{execute}}

Click on the `SWPC Lite` tab above to see our running web page.