#!/bin/bash
echo "Which debezium-server would you like to build and push? (e.g: 2.5)"
read VERSION
docker build -t artielabs/debezium-server:$VERSION $VERSION/
docker push artielabs/debezium-server:$VERSION
