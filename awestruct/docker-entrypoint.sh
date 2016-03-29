#!/bin/bash

# Exit immediately if a *pipeline* returns a non-zero status. (Add -x for command tracing)
set -e

if [[ -z $1 ]]; then
    ARG1="run"
else
    ARG1=$1
fi

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

# Create a local 'bundle' directory, and ensure there is a .gitignore file to ignore everything in the cache directory ...
export BUNDLE_HOME=$SITE_HOME/bundle
mkdir -p $BUNDLE_HOME
if [ ! -e $BUNDLE_HOME/.gitignore ]; then
    echo '*' > $BUNDLE_HOME/.gitignore
fi

mkdir -p $BUNDLE_HOME/bin
export BUNDLE_BIN=$BUNDLE_HOME/bin
export GEM_PATH=$BUNDLE_HOME:$BUNDLE_PATH
export BUNDLE_PATH=$BUNDLE_HOME
export PATH=$BUNDLE_HOME/bin:$PATH

# Process some known arguments ...
case $ARG1 in
    run)
        # Check to see if the site has any locally-cached gems in its bundle directory ...
        if [ ! -d "$BUNDLE_HOME/gems" ]; then
            # There are no Gems installed, so install them exactly per the Gemfile.lock file ...
            bundle --clean install
        fi

        # We need to patch awestruct to make auto generation work. On mounted volumes file
        # change montoring will only work with polling
        gem contents awestruct | grep auto.rb | xargs sed -i "s/^\(.*force_polling =\).*/\1 true/"

        # Run Awestruct
        exec bundle exec awestruct -d
        ;;
    bundle)
        echo "Running the following command:"
        echo "   $@"
        exec "$@"
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
        echo "   bundle ..."
        echo "        Runs the Ruby Bundler using the dependencies defined in the Gemfile."
        echo "        Use this to manually install or update any of the dependencies."
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
