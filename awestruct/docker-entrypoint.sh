#!/bin/bash

# Exit immediately if a *pipeline* returns a non-zero status. (Add -x for command tracing)
set -e

if [[ -z $1 ]]; then
    ARG1="run"
else
    ARG1=$1
fi

# Change the path where Bundler can find gems. Normally this defaults
# to '.bundle', but on this image it defaults to a different location
# so we fix that here
mkdir -p $SITE_HOME/.bundle/ruby/$RUBY_VERSION/
export BUNDLE_PATH=$SITE_HOME/.bundle/ruby/$RUBY_VERSION/

# We also have to update the PATH to include the '_bin' directory
# in the site's home directory so that `rake` can find Awestruct
mkdir -p $SITE_HOME/_bin
export PATH=$SITE_HOME/_bin:$PATH

# Rakefile takes BIND into account
# used to bind awestruct to 0.0.0.0 instead of localhost
# otherwise the port is not exposed out of docker
export BIND="-b 0.0.0.0"

# Check to see if the site has any files ...
if [ $(find $SITE_HOME -maxdepth 0 -type d -empty 2>/dev/null) ]; then
    echo "****************************************************************************************************"
    echo "**"
    echo "**   WARNING: The site directory is empty."
    echo "**"
    echo "**   Be sure to first use Git to check out the source files for the site. Then, when starting the" 
    echo "**   container, be sure to mount the directory containing those files to ${SITE_HOME}:"
    echo "**"
    echo "**        docker run -it -P --rm -v /path/to/your/code:/site debezium/awestruct"
    echo "**"
    echo "**   This is a little easier when running in the same directory as the site code:"
    echo "**"
    echo "**        docker run -it -P --rm -v $(pwd):/site debezium/awestruct"
    echo "**"
    echo "**   To run the container in interactive mode by adding 'bash' to the end of the 'docker' command:"
    echo "**"
    echo "**        docker run -it -P --rm -v $(pwd):/site debezium/awestruct bash"
    echo "**"
    echo "**   See http://awestruct.org/getting_started/ for details."
    echo "**"
    echo "****************************************************************************************************"
    echo ""
fi

# Process some known arguments ...
case $ARG1 in
    run)
        # Check to see if the site has any locally-cached gems in its .bundle directory ...
        if [[ ! -d "$BUNDLE_PATH/gems" || ! -d "_bin" ]]; then
            # At least one of the directories does not exist, so we know the required Gems are not properly
            # installed. Use Rake to install them exactly per the Gemfile.lock file ...
            rake setup
            export BUNDLE_PATH=$SITE_HOME/.bundle/ruby/$RUBY_VERSION/
            export PATH=$SITE_HOME/_bin:$PATH
        fi

        # We need to patch awestruct to make auto generation work. On mounted volumes file
        # change montoring will only work with polling
        gem contents awestruct | grep auto.rb | xargs sed -i "s/^\(.*force_polling =\).*/\1 true/"

        # Run rake
        exec rake clean preview
        ;;
    clean)
        echo "Running the following command:"
        echo "   rake clean"
        exec rake clean
        ;;
    setup)
        exec rake setup
        ;;
    help)
        echo ""
        echo "Usage:  "
        echo ""
        echo "   docker run -it -p 4242:4242 --rm -v $(pwd):/site debezium/awestruct COMMAND"
        echo ""
        echo "where COMMAND is one of the following:"
        echo ""
        echo "   run"
        echo "        Uses Awestruct to generate the site and run a local webserver so the site"
        echo "        can be edited, developed, and viewed locally. This will install all Ruby Gems"
        echo "        if not already done so."
        echo ""
        echo "   setup"
        echo "        Set up the environment by downloading all libraries used by the build."
        echo ""
        echo "   rake ..."
        echo "        Run the Rake command (with any extra parameters) and exit."
        echo ""
        echo "   bash"
        echo "        Starts a shell in this container, for interactively running commands."
        echo ""
        echo "   help"
        echo "        Displays this help information."
        echo ""
        exit 1
        ;;
esac

# Otherwise just run the specified command
exec "$@"
