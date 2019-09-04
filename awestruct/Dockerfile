FROM ruby:2.3
 
LABEL maintainer="Debezium Community"
 
ENV SITE_HOME=/site \
    CACHE_HOME=/cache \
    HOME=/home/awestruct \
    NODE_PATH=/usr/local/share/.config/yarn/global/node_modules

# Install Node.js - Required by Antora
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs

# Install Yarn
RUN npm install -g yarn

# Install Antora framework
RUN yarn global add @antora/cli@latest @antora/site-generator-default@latest \
    && rm -rf $(yarn cache dir)/* \
    && find $(yarn global dir)/node_modules/asciidoctor.js/dist/* -maxdepth 0 -not -name node -exec rm -rf {} \; \
    && find $(yarn global dir)/node_modules/handlebars/dist/* -maxdepth 0 -not -name cjs -exec rm -rf {} \; \
    && find $(yarn global dir)/node_modules/handlebars/lib/* -maxdepth 0 -not -name index.js -exec rm -rf {} \; \
    && find $(yarn global dir)/node_modules/isomorphic-git/dist/* -maxdepth 0 -not -name for-node -exec rm -rf {} \; \
    && rm -rf $(yarn global dir)/node_modules/moment/min \
    && rm -rf $(yarn global dir)/node_modules/moment/src \
    && apt-get install -y jq \
    && rm -rf /tmp/*

RUN apt-get install git

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
