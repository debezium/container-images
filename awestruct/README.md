The [Debezium website](http://debezium.io) is built using [Awestruct](http://awestruct.org), a framework for creating static HTML sites. This container is used for development of the Debezium website, though it is possible to use it for other sites.

# How to use this image

This image is primarily for those developing the Debezium website. 

## Step 1: Get the site code

Use Git to clone the Debezium website Git repository and change into that directory:

    $ git clone https://github.com/debezium/debezium.github.io.git
    $ cd debezium.github.io

If you're using this image to develop a website other than Debezium's, obtain a local copy of that site's codebase.

## Step 2: Running the webserver

Start a container using this image that will generate the static site and run a development webserver to serve the content:

    $ docker run -it --rm -p 4242:4242 -v $(pwd):/site debezium/awestruct

This command tells Docker to download the `debezium/awestruct` image if necessary, start up a Docker container using this image, and give you an interactive terminal (via `-it` flag) to the container so that you will see the output of the process running in the container. The `--rm` flag will remove the container when it stops, the `-p 4242` flag maps the container's 4242 port to the same port on the Docker host (which is the local machine on Linux or the virtual machine if running Boot2Docker or Docker Machine on OS X and Windows). The `-v $(pwd):/site` option mounts your current working directory into the `/site` directory within the container, which is where Awestruct expects to find your website code.

Use CTRL-C to stop the webserver. The container will often detect changes in the code and regenerate, but if this does not happen you can stop the webserver (and the container) and restart the container. Alternatively, you can run the container with a shell and directly use the Rake commands. The following command runs the container with a shell:

    $ docker run -it --rm -p 4242:4242 -v $(pwd):/site debezium/awestruct shell

When the container starts, the container's shell will start inside the `/site` directory, which is where your source code is. To manually setup the libraries, run:

    $site/: rake setup

When this completes, you can run the webserver with:

    $site/: rake clean preview

and use CTRL-C to stop the webserver (and stay in the container). Simply run these commands as necessary.

## Step 3: View the site

If you're running on Linux, simply point your browser to http://localhost:4242. If your running OS X or Windows, use Docker Machine to tell you the address of the Docker host:

    $ docker-machine ip

Then point your browser to http:://_dockerhostip_:4242. You can often do this from the command line with:

    $ open http://$(docker-machine ip):4242

The site is generated somewhat lazily, so it may not be the fastest.

## Step 4: Edit the site

Use any development tools on your local machine to edit the source files for the site. For minor modifications, Awestruct will detect the changes and will regenerate the corresponding static file(s). However, more comprehensive modifications may require you to restart the container (step 2).

If you have to change the `Gemfile` to use different libraries, you can either run the container with the `setup` command:

    $ docker run -it --rm -p 4242:4242 -v $(pwd):/site debezium/awestruct setup

or, if you're running a shell in the container, run rake directly:

    $site/: rake setup

(Alternatively, you can run `bundle install` manually from the shell as well.)

## Step 5: Commit changes

Use Git on your local machine to commit the changes to your site's codebase, and then publish the new version of the site.
