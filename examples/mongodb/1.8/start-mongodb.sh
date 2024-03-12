#!/usr/bin/env bash

set -e
# enable job control used fg 
set -m

function wait_mongodb_upandready {
  # Wait until Mongo is ready to accept connections, exit if this does not happen within 30 seconds
  COUNTER=0
  until mongosh --quiet --eval "use admin; printjson(db.serverStatus());"
  do
    sleep 1
    COUNTER=$((COUNTER+1))
    if [ "${COUNTER}" -gt "30" ]; then
      echo "MongoDB did not initialize within 30 seconds, exiting"
      exit 2
    fi
    echo "Waiting for MongoDB to initialize... ${COUNTER}/30"
  done
}

function deploy_replica_set {
  wait_mongodb_upandready
  mongosh -u admin -p admin --authenticationDatabase admin localhost:27017/inventory <<-EOF
  var repsetmembers = {_id : "rs0",members: []};
  var arrayhosts = "${REPLICA_SET_HOSTS}".split(',');
  for(var i = 0; i < arrayhosts.length; i++) {
     repsetmembers['members'].push({ _id: i, host: arrayhosts[i]});
  }
  print("Initializing replica set:\n" + JSON.stringify(repsetmembers));
  rs.initiate(repsetmembers);
  print('Initiated replica set');
EOF
  echo "Successfully initialized inventory database"
}

function deploy_inventory_database {
  wait_mongodb_upandready
  echo "Deploying users and roles"
  mongosh localhost:27017/admin <<-EOF
      db.createUser({ user: 'admin', pwd: 'admin', roles: [ { role: "root", db: "admin" } ] });
EOF
  
  mongosh -u admin -p admin localhost:27017/admin <<-EOF
      db.runCommand({
          createRole: "listDatabases",
          privileges: [
              { resource: { cluster : true }, actions: ["listDatabases"]}
          ],
          roles: []
      });
  
      db.runCommand({
          createRole: "readChangeStream",
          privileges: [
              { resource: { db: "", collection: ""}, actions: [ "find", "changeStream" ] }
          ],
          roles: []
      });
  
      db.createUser({
          user: 'debezium',
          pwd: 'dbz',
          roles: [
              { role: "readWrite", db: "inventory" },
              { role: "read", db: "local" },
              { role: "listDatabases", db: "admin" },
              { role: "readChangeStream", db: "admin" },
              { role: "read", db: "config" },
              { role: "read", db: "admin" }
          ]
      });
EOF
  
  echo "Created users"
  
  mongosh -u debezium -p dbz --authenticationDatabase admin localhost:27017/inventory <<-EOF
      db.products.insert([
          { _id : NumberLong("101"), name : 'scooter', description: 'Small 2-wheel scooter', weight : 3.14, quantity : NumberInt("3") },
          { _id : NumberLong("102"), name : 'car battery', description: '12V car battery', weight : 8.1, quantity : NumberInt("8") },
          { _id : NumberLong("103"), name : '12-pack drill bits', description: '12-pack of drill bits with sizes ranging from #40 to #3', weight : 0.8, quantity : NumberInt("18") },
          { _id : NumberLong("104"), name : 'hammer', description: "12oz carpenter's hammer", weight : 0.75, quantity : NumberInt("4") },
          { _id : NumberLong("105"), name : 'hammer', description: "14oz carpenter's hammer", weight : 0.875, quantity : NumberInt("5") },
          { _id : NumberLong("106"), name : 'hammer', description: "16oz carpenter's hammer", weight : 1.0, quantity : NumberInt("0") },
          { _id : NumberLong("107"), name : 'rocks', description: 'box of assorted rocks', weight : 5.3, quantity : NumberInt("44") },
          { _id : NumberLong("108"), name : 'jacket', description: 'water resistent black wind breaker', weight : 0.1, quantity : NumberInt("2") },
          { _id : NumberLong("109"), name : 'spare tire', description: '24 inch spare tire', weight : 22.2, quantity : NumberInt("5") }
      ]);
  
      db.customers.insert([
          { _id : NumberLong("1001"), first_name : 'Sally', last_name : 'Thomas', email : 'sally.thomas@acme.com' },
          { _id : NumberLong("1002"), first_name : 'George', last_name : 'Bailey', email : 'gbailey@foobar.com' },
          { _id : NumberLong("1003"), first_name : 'Edward', last_name : 'Walker', email : 'ed@walker.com' },
          { _id : NumberLong("1004"), first_name : 'Anne', last_name : 'Kretchmar', email : 'annek@noanswer.org' }
      ]);
  
      db.orders.insert([
          { _id : NumberLong("10001"), order_date : new ISODate("2016-01-16T00:00:00Z"), purchaser_id : NumberLong("1001"), quantity : NumberInt("1"), product_id : NumberLong("102") },
          { _id : NumberLong("10002"), order_date : new ISODate("2016-01-17T00:00:00Z"), purchaser_id : NumberLong("1002"), quantity : NumberInt("2"), product_id : NumberLong("105") },
          { _id : NumberLong("10003"), order_date : new ISODate("2016-02-19T00:00:00Z"), purchaser_id : NumberLong("1002"), quantity : NumberInt("2"), product_id : NumberLong("106") },
          { _id : NumberLong("10004"), order_date : new ISODate("2016-02-21T00:00:00Z"), purchaser_id : NumberLong("1003"), quantity : NumberInt("1"), product_id : NumberLong("107") }
      ]);
EOF
    
    echo "Inserted example data"
}

# echo '' > /var/log/mongodb/mongod.log
mongod --keyFile /etc/mongodb.keyfile --fork --logpath /var/log/mongodb/mongod.log
deploy_inventory_database

echo "Restarting...."
mongod --shutdown 

mongod --bind_ip_all --replSet rs0 --keyFile /etc/mongodb.keyfile &\
deploy_replica_set &&\
fg
