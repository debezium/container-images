FROM ruby:2.3
 
LABEL maintainer="Debezium Community" http://debezium.io
 
ENV SITE_HOME=/site \
    CACHE_HOME=/cache \
    HOME=/home/awestruct

# Set up a user to run Awestruct and own all of its files (including the gems)
RUN useradd -m awestruct && \
    mkdir -p $SITE_HOME && \
    mkdir -p $CACHE_HOME/gems/bin && \
    chown -R awestruct:awestruct $HOME && \
    chown -R awestruct:awestruct $CACHE_HOME && \
    chown -R awestruct:awestruct $SITE_HOME
USER awestruct
WORKDIR $HOME
 
# Install Rake and Bundler. This is the minimum needed to generate the site ...
RUN gem install rdoc rake bundler
 
WORKDIR $SITE_HOME
VOLUME [ $SITE_HOME ]
 
EXPOSE 4242
 
# Install the entry point that will be called by default ...
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
 
# And execute 'run' by default ...
CMD ["run"]