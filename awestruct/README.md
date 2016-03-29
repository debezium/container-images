The [Debezium website](http://debezium.io) is built using [Awestruct](http://awestruct.org), a framework for creating static HTML sites. This container is used for development of the Debezium website, though it is possible to use it for other sites.

# How to use this image

This image is primarily for those developing the Debezium website. 

## Step 1: Get the site code

Use Git to clone the Debezium website Git repository and change into that directory:

    $ git clone https://github.com/debezium/debezium.io.git
    $ cd debezium.io

If you're using this image to develop a website other than Debezium's, obtain a local copy of that site's codebase.

## Step 2: Running the webserver

Start a container using this image that will generate the static site and run a development webserver to serve the content:

    $ docker run -it --rm -p 4242:4242 -v $(pwd):/site debezium/awestruct

This command tells Docker to download the `debezium/awestruct` image if necessary, start up a Docker container using this image, and give you an interactive terminal (via `-it` flag) to the container so that you will see the output of the process running in the container. The `--rm` flag will remove the container when it stops, the `-p 4242` flag maps the container's 4242 port to the same port on the Docker host (which is the local machine on Linux or the virtual machine if running Boot2Docker or Docker Machine on OS X and Windows). The `-v $(pwd):/site` option mounts your current working directory into the `/site` directory within the container, which is where Awestruct expects to find your website code.

## Step 3: Forward port

If you are running on Linux, you can skip this step.

If you are running on Windows or OS X and are using [Docker Machine](https://www.docker.com/toolbox) or Boot2Docker to run the Docker host, then the container is running in a virtual machine. Although you can point your browser to the correct IP address, the generated site (at least in development mode) assumes a base URL of http://localhost:4242 and thus links will not work. Instead, use the following command to forward port 4242 on your local machine to the virtual machine. For Docker Machine, start a new terminal and run the following commands:

    $ eval $(docker-machine env)
    $ docker-machine ssh default -vnNTL *:4242:$(docker-machine ip):4242

or, for Boot2Docker:

    $ boot2docker shellinit
    $ boot2docker ssh -vnNTL *:4242:$(boot2docker ip 2>/dev/null):4242

Leave this running while you access the website through your browser. Use CTRL-C to stop this port forwarding process when you're finished testing.

## Step 4: View the site

Point your browser to http://localhost:4242 to view the site. The site is generated somewhat lazily, so it may not be the fastest.

## Step 5: Edit the site

Use any development tools on your local machine to edit the source files for the site. For minor modifications, Awestruct will detect the changes and will regenerate the corresponding static file(s). However, more comprehensive modifications may require you to restart the container (step 2).

If you have to change the `Gemfile` to use different libraries, you will need to let the container download the new versions. The simplest way to do this is to stop the container (using CTRL-C), use `rm -rf bundler` to remove the directory where the gem files are stored, and then restart the container. This ensures that you're always using the exact files that are specified in the `Gemfile.lock` file.

## Step 6: Commit changes

Use Git on your local machine to commit the changes to your site's codebase, and then publish the new version of the site.
