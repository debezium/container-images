#!/bin/bash

SRC_REGISTRY='debezium'
DEST_REGISTRY='quay.io/debezium'

IMAGES='zookeeper kafka connect-base connect postgres mongo-initiator example-mysql example-mysql-gtids example-postgres example-mongodb'

for IMAGE in $IMAGES; do
  TAGS="$(skopeo inspect docker://debezium/$IMAGE | jq -r .RepoTags[])"
  for TAG in $TAGS; do
    echo '---------------------------'
    echo Synchronizing $IMAGE:$TAG
    skopeo copy --dest-creds "$DEST_CREDENTIALS" docker://$SRC_REGISTRY/$IMAGE:$TAG docker://quay.io/debezium/$IMAGE:$TAG
    echo '---------------------------'
  done
done
