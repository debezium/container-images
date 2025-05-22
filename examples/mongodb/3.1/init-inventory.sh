mongosh localhost:27017/inventory --eval "
    rs.initiate({
        _id: 'rs0',
        members: [ { _id: 0, host: 'localhost:27017' } ]
    });"

echo "Initiated replica set"

sleep 3

mongosh localhost:27017/admin --eval "
    db.createUser({ user: 'admin', pwd: 'admin', roles: [ { role: 'userAdminAnyDatabase', db: 'admin' } ] });
"

mongosh -u admin -p admin localhost:27017/admin --eval "
    db.runCommand({
        createRole: 'listDatabases',
        privileges: [
            { resource: { cluster : true }, actions: ['listDatabases']}
        ],
        roles: []
    });

    db.runCommand({
        createRole: 'readChangeStream',
        privileges: [
            { resource: { db: '', collection: ''}, actions: [ 'find', 'changeStream' ] }
        ],
        roles: []
    });

    db.createUser({
        user: 'debezium',
        pwd: 'dbz',
        roles: [
            { role: 'readWrite', db: 'inventory' },
            { role: 'read', db: 'local' },
            { role: 'listDatabases', db: 'admin' },
            { role: 'readChangeStream', db: 'admin' },
            { role: 'read', db: 'config' },
            { role: 'read', db: 'admin' }
        ]
    });
"

echo "Created users"

mongosh -u debezium -p dbz localhost:27017 --file /usr/local/bin/insert-inventory-data.js

echo "Inserted example data"
