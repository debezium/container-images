####
# This Dockerfile is used in order to build a container with Debezium platform UI.
###
ARG BRANCH=main

# Clone the repository
FROM registry.access.redhat.com/ubi9/ubi-minimal AS cloner
ARG BRANCH
WORKDIR /app
RUN microdnf install -y git
# Please do not aggregate the following line with other.
# This is explicitely leaved in a single line since it will be replace in the release pipeline
RUN git clone -b ${BRANCH} https://github.com/debezium/debezium-platform.git
RUN cd debezium-platform && \
    cd debezium-platform-stage 

# Build the application
FROM registry.access.redhat.com/ubi9/nodejs-20 AS builder
USER root
RUN mkdir -p /app && chown 1001:1001 /app
USER 1001
RUN npm install -g yarn

WORKDIR /app
COPY --from=cloner /app/debezium-platform/debezium-platform-stage/package.json /app/
COPY --from=cloner /app/debezium-platform/debezium-platform-stage/yarn.lock /app/
RUN yarn install

COPY --from=cloner /app/debezium-platform/debezium-platform-stage /app
RUN yarn build

# Final image
FROM mirror.gcr.io/library/node:20-alpine
RUN yarn global add serve

WORKDIR /app
COPY --from=builder /app/dist /app/dist
COPY --from=cloner /app/debezium-platform/debezium-platform-stage/inject-env.sh /inject-env.sh
RUN chmod +x /inject-env.sh

LABEL maintainer="Debezium Community" \
      description="Debezium Platform Stage UI"

EXPOSE 3000
CMD ["/inject-env.sh"]