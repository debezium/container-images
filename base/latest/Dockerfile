FROM alpine:3.14

LABEL maintainer="R2 Innovations"

USER root
RUN apk update &&\
    apk add --no-cache openjdk11-jdk tar gzip iproute2 findutils unzip &&\
    rm -rf /var/cache/apk/*