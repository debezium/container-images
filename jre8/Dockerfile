# A base docker image for the Debezium Java-based images, with OpenJDK 8 (JRE) installed.

FROM debian:8.3

MAINTAINER Debezium Community

ENV JAVA_VERSION="8"

RUN awk '$1 ~ "^deb" { $3 = $3 "-backports"; print; exit }' /etc/apt/sources.list > /etc/apt/sources.list.d/backports.list && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl openjdk-${JAVA_VERSION}-jre-headless