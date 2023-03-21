Initiate a MongoDB replica set on a set of running MongoDB servers, and optionally add the replica set as a shard to one or more running MongoDB routers.

# How to use this image

## Initiate a replica set

With one or more MongoDB servers already running, start a container with this image to check if the replica set is initiated, and if not to initiate it and add all of the servers to the replica set. Start the container with the name of the replica set in the `$REPLICASET` environment variable, using links named like "MONGO_n_" (where _n_=1,2,3, etc.) for each of the MongoDB servers that are to be in the replica set.

For example, consider three already-running MongoDB servers running in containers `data1`, `data2`, and `data3`. Running a container using the following command will check whether the replica set named `rs0` is properly initiated on these servers, and if not will initiate the replica set:

    $ docker run -it --name mongo-init --rm -e REPLICASET=rs0 --link data1:mongo1 --link data2:mongo2 --link data3:mongo3 quay.io/debezium/mongo-initiator

The container will exit as soon as the replica set is initiated.

## Initiate a shard replica set

The container can optionally add the replica set as a _shard_ to one or more MongoDB routers. For example, consider three MongoDB servers running in containers `shardA1`, `shardA2`, and `shardA3`, and two MongoDB routers running in containers `router1` and `router2`. The following command will ensure that `shardA1`, `shardA2`, and `shardA3` are properly initiated as replica set `shardA`, and that the `shardA` replica set is added as a shard to the routers `router1` and `router2`:

    $ docker run -it --name mongo-init --rm -e REPLICASET=shardA --link shardA1:mongo1 --link shardA2:mongo2 --link shardA3:mongo3 --link router1 --link router2 quay.io/debezium/mongo-initiator

Additional shard replica sets can be initiated and added by running additional containers. For example:

    $ docker run -it --name mongo-init --rm -e REPLICASET=shardB --link shardB1:mongo1 --link shardB2:mongo2 --link shardB3:mongo3 --link router1 --link router2 quay.io/debezium/mongo-initiator



