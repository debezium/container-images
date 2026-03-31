HOSTNAME=${HOSTNAME:=`hostname`}

  OPTS=`getopt -o h: --long hostname: -n 'parse-options' -- "$@"`
  if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi

  echo "$OPTS"
  eval set -- "$OPTS"

  while true; do
    case "$1" in
      -h | --hostname )     HOSTNAME=$2;        shift; shift ;;
      -- ) shift; break ;;
      * ) break ;;
    esac
  done
echo "Using HOSTNAME='$HOSTNAME'"

mongosh -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD $HOSTNAME:27017/ --eval "
    rs.initiate({
        _id: 'rs0',
        members: [ { _id: 0, host: '${HOSTNAME}:27017' } ]
    });"

echo "Initiated replica set"

sleep 3

mongosh -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD $HOSTNAME:27017/admin --eval "
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

mongosh -u debezium -p dbz $HOSTNAME:27017 --file /usr/local/bin/insert-inventory-data.js

echo "Inserted example data"
