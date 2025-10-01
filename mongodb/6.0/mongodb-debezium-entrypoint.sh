#!/usr/bin/env sh

set -ex

PIDFILE="/tmp/mongod.pid"
INIT_DIR="/docker-entrypoint-initdb.d"
METADATA_DIR="/data/db/.metadata"
REPLICA_FILE="$METADATA_DIR/.replicaset"
LOG_PATH="/tmp/mongod.log"
DB_PATH="/data/db"
PORT=27017

# Default values
: "${MONGO_INITDB_DATABASE:=admin}"
: "${RS_NAME:=rs0}"
: "${HOSTNAME:=$(hostname)}"
: "${MONGODB_KEYFILE:=/etc/mongodb.keyfile}"
: "${MONGO_INITDB_ROOT_USERNAME:=admin}"
: "${MONGO_INITDB_ROOT_PASSWORD:=admin}"


if command -v mongosh >/dev/null 2>&1; then
  MONGO_SHELL="mongosh"
elif command -v mongo >/dev/null 2>&1; then
  MONGO_SHELL="mongo"
else
  echo "No MongoDB shell found (mongosh or mongo). Exiting."
  exit 127
fi


if [ ! -f "$REPLICA_FILE" ]; then
  echo "=> Starting MongoDB without auth for initialization..."
  mongod --fork --dbpath "$DB_PATH" --port "$PORT" --logpath "$LOG_PATH" --pidfilepath "$PIDFILE"

  echo "=> Waiting for MongoDB to start..."
  tries=30
  while true; do
    if ! { [ -s "$PIDFILE" ] && ps "$(cat "$PIDFILE")" > /dev/null 2>&1; }; then
      echo "❌ mongod process did not stay running. Check logs for errors."
      exit 1
    fi

    if $MONGO_SHELL --host 127.0.0.1 --port "$PORT" --quiet "$MONGO_INITDB_DATABASE" --eval 'quit(0)' > /dev/null 2>&1; then
      break
    fi

    tries=$((tries - 1))
    if [ "$tries" -le 0 ]; then
      echo "❌ mongod did not accept connections quickly enough. Check logs for errors."
      exit 1
    fi

    sleep 1
  done

  echo "=> Creating root user..."
  $MONGO_SHELL admin --eval "db.createUser({user:'$MONGO_INITDB_ROOT_USERNAME',pwd:'$MONGO_INITDB_ROOT_PASSWORD',roles:[{role:'root',db:'admin'}]})"

  echo "=> Shutting down temporary MongoDB..."
  mongod --shutdown

  echo "=> Starting MongoDB with replica set and auth..."
  mongod --fork --logpath "$LOG_PATH" --keyFile "$MONGODB_KEYFILE" --replSet "$RS_NAME" --shardsvr --dbpath "$DB_PATH" --port "$PORT"

  echo "=> Initiating replica set..."
  CONFIG="{_id:\"$RS_NAME\",version:1,members:[{_id:0,host:\"$HOSTNAME:$PORT\"}]}"
  $MONGO_SHELL -u "$MONGO_INITDB_ROOT_USERNAME" -p "$MONGO_INITDB_ROOT_PASSWORD" --authenticationDatabase admin --eval "printjson(rs.initiate($CONFIG))"

  echo "=> Running initialization scripts from $INIT_DIR..."
  if [ -d "$INIT_DIR" ]; then
    for f in "$INIT_DIR"/*; do
      case "$f" in
        *.sh)
          echo "=> Executing shell script: $f"
          . "$f"
          ;;
        *.js)
          echo "=> Executing MongoDB script: $f"
          $MONGO_SHELL -u "$MONGO_INITDB_ROOT_USERNAME" -p "$MONGO_INITDB_ROOT_PASSWORD" --authenticationDatabase admin "$MONGO_INITDB_DATABASE" "$f"
          ;;
        *)
          echo "=> Ignoring file: $f"
          ;;
      esac
    done
  fi

  echo "=> Finalizing setup..."
  mkdir -p "$METADATA_DIR"
  touch "$REPLICA_FILE"
  mongod --shutdown

  echo "=> Starting MongoDB normally..."
  exec mongod --keyFile "$MONGODB_KEYFILE" --replSet "$RS_NAME" --shardsvr --dbpath "$DB_PATH" --port "$PORT" --bind_ip_all
else
  echo "=> MongoDB already initialized, starting normally..."
  exec mongod --keyFile "$MONGODB_KEYFILE" --replSet "$RS_NAME" --shardsvr --dbpath "$DB_PATH" --port "$PORT" --bind_ip_all
fi