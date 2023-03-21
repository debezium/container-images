# Introduction
The [Debezium website](https://debezium.io) is built using [Jekyll](https://jekyllrb.com/), a framework for creating static HTML sites. This container is used for development of the Debezium website, though it is possible to use it for other sites.

# How to use this image

This image is primarily for those developing the Debezium website. 

## Step 1: Get the site code

Use Git to clone the Debezium website Git repository and change into that directory:

    $ git clone https://github.com/debezium/debezium.github.io.git
    $ cd debezium.github.io

If you're using this image to develop a website other than Debezium's, obtain a local copy of that site's codebase.

## Step 2: Running the webserver

Start a container using this image that will generate the static site and run a development webserver to serve the content:

    $ docker run --privileged -it --rm -p 4000:4000 -e LC_ALL=C.UTF-8 -e LANG=C.UTF-8 -v $(pwd):/site quay.io/debezium/website-builder bash

This command tells Docker to download the `debezium/website-builder` image if necessary, start up a Docker container using this image, and give you an interactive terminal (via `-it` flag) to the container so that you will see the output of the process running in the container. The `--rm` flag will remove the container when it stops, the `-p 4040` flag maps the container's 4040 port to the same port on the Docker host (which is the local machine on Linux or the virtual machine if running Boot2Docker or Docker Machine on OS X and Windows). The `-v $(pwd):/site` option mounts your current working directory into the `/site` directory within the container.

Next, in the shell in the container, run the following commands to update and then (re)install all of the Ruby libraries required by the website:

    jekyll@49d06009e1fa:/site$ bundle update
    jekyll@49d06009e1fa:/site$ bundle install

This should only need to be performed once. After the libraries are installed, we can then build the site from the code so you can preview it in a browser:

    jekyll@49d06009e1fa:/site$ rake clean preview

With the integration with Antora, the above command will now also fetch the main codebase repository and will invoke the Antora build process to build the version-specific documentation prior to invoking Jekyll. For information on Antora and how we've integrated it into the build process, please see ANTORA.md.


## Step 3: View the site

Point your browser to http://localhost:4000 to view the site. You may notice some delay during development, since the site is generated somewhat lazily.

## Step 4: Edit the site

Use any development tools on your local machine to edit the source files for the site. For very minor modifications, Jekyll will detect the changes and may regenerate the corresponding static file(s). However, we generally recommend that you use CTRL-C in the container shell to stop the preview server, re-run the rake clean preview command, and refresh your browser.

If you have to change the Gemfile to use different libraries, you will need to let the container download the new versions. The simplest way to do this is to stop the container (using CTRL-C), use rm -rf bundler to remove the directory where the gem files are stored, and then restart the container. This ensures that you're always using the exact files that are specified in the Gemfile.lock file.

## Step 5: Commit changes

Use Git on your local machine to commit the changes to your site's codebase, and then publish the new version of the site.
