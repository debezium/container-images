FROM mirror.gcr.io/library/ruby:3.2-alpine
LABEL maintainer="Debezium Community"
ENV SITE_HOME=/site
RUN apk add --no-cache build-base gcc bash cmake git jq nodejs yarn curl
# Install Antora framework
RUN yarn global add @antora/cli@3.1.10 @antora/site-generator-default@3.1.10 @antora/asciidoc-loader @antora/content-aggregator \
    && yarn global add --ignore-optional --silent $(grep -o '^isomorphic-git@[^:]*' `yarn global dir`/yarn.lock) \
    && rm -rf $(yarn cache dir)/* \
    && find $(yarn global dir)/node_modules/handlebars/dist/* -maxdepth 0 -not -name cjs -exec rm -rf {} \; \
    && find $(yarn global dir)/node_modules/handlebars/lib/* -maxdepth 0 -not -name index.js -exec rm -rf {} \; \
    && rm -rf $(yarn global dir)/node_modules/moment/min \
    && rm -rf $(yarn global dir)/node_modules/moment/src \
    && rm -rf /tmp/*

# Install Rake and Bundler. This is the minimum needed to generate the site ...
RUN gem update --system 3.4.22 \
    && gem install bundler -v "~>1.0" \
    && gem install rdoc -v 6.2.0 \
    && gem install bundler -v 2.4.22 \
    && gem install jekyll -v ">= 3.8.3, < 4.3" \
    && gem install rake


#Copy over the gemfile to a temporary directory and run the install command. 
WORKDIR /tmp
RUN curl -H 'Accept: application/vnd.github.v3.raw' https://raw.githubusercontent.com/debezium/debezium.github.io/develop/Gemfile >> Gemfile \
    && curl -H 'Accept: application/vnd.github.v3.raw' https://raw.githubusercontent.com/debezium/debezium.github.io/develop/Gemfile.lock >> Gemfile.lock
RUN bundle install 

WORKDIR $SITE_HOME
 
EXPOSE 4000
 
# And execute 'run' by default ...
CMD ["run"]
