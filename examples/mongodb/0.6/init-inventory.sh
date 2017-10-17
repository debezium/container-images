HOSTNAME=`hostname`

mongo localhost:27017/inventory <<-EOF
    rs.initiate({
        _id: "rs0",
        members: [ { _id: 0, host: "${HOSTNAME}:27017" } ]
    });
EOF
echo "Initiated replica set"

sleep 3
mongo localhost:27017/admin <<-EOF
    db.createUser({ user: 'admin', pwd: 'admin', roles: [ { role: "userAdminAnyDatabase", db: "admin" } ] });
EOF

mongo -u admin -p admin localhost:27017/admin <<-EOF
    db.runCommand({
        createRole: "listDatabases",
        privileges: [
            { resource: { cluster : true }, actions: ["listDatabases"]}
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
            { role: "read", db: "admin" }
        ]
    });
EOF

echo "Created users"

mongo -u debezium -p dbz --authenticationDatabase admin localhost:27017/inventory <<-EOF
    use inventory;

    db.products.insert([
        { _id : 101, name : 'scooter', description: 'Small 2-wheel scooter', weight : 3.14, quantity : 3 },
        { _id : 102, name : 'car battery', description: '12V car battery', weight : 8.1, quantity : 8 },
        { _id : 103, name : '12-pack drill bits', description: '12-pack of drill bits with sizes ranging from #40 to #3', weight : 0.8, quantity : 18 },
        { _id : 104, name : 'hammer', description: "12oz carpenter's hammer", weight : 0.75, quantity : 4 },
        { _id : 105, name : 'hammer', description: "14oz carpenter's hammer", weight : 0.875, quantity : 5 },
        { _id : 106, name : 'hammer', description: "16oz carpenter's hammer", weight : 1.0, quantity : 0 },
        { _id : 107, name : 'rocks', description: 'box of assorted rocks', weight : 5.3, quantity : 44 },
        { _id : 108, name : 'jacket', description: 'water resistent black wind breaker', weight : 0.1, quantity : 2 },
        { _id : 109, name : 'spare tire', description: '24 inch spare tire', weight : 22.2, quantity : 5 }
    ]);

    db.customers.insert([
        { _id : 1001, first_name : 'Sally', last_name : 'Thomas', email : 'sally.thomas@acme.com' },
        { _id : 1002, first_name : 'George', last_name : 'Bailey', email : 'gbailey@foobar.com' },
        { _id : 1003, first_name : 'Edward', last_name : 'Walker', email : 'ed@walker.com' },
        { _id : 1004, first_name : 'Anne', last_name : 'Kretchmar', email : 'annek@noanswer.org' }
    ]);

    db.orders.insert([
        { _id : 10001, order_date : new ISODate("2016-01-16T00:00:00Z"), purchaser_id : 1001, quantity : 1, product_id : 102 },
        { _id : 10002, order_date : new ISODate("2016-01-17T00:00:00Z"), purchaser_id : 1002, quantity : 2, product_id : 105 },
        { _id : 10003, order_date : new ISODate("2016-02-19T00:00:00Z"), purchaser_id : 1002, quantity : 2, product_id : 106 },
        { _id : 10004, order_date : new ISODate("2016-02-21T00:00:00Z"), purchaser_id : 1003, quantity : 1, product_id : 107 }
    ]);
EOF

echo "Inserted example data"
