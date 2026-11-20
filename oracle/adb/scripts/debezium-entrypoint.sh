#!/bin/bash
#
# Wraps the adb-free entrypoint so that Debezium-specific provisioning runs once the
# database becomes available. The adb-free image has no setup/startup script hooks, and
# once the database is open it denies all OS-authenticated administrative logons, so all
# provisioning must be performed through the ADB service as the ADMIN user.

/u01/scripts/entrypoint.sh &
ADB_ENTRYPOINT_PID=$!

trap 'kill -TERM ${ADB_ENTRYPOINT_PID} 2>/dev/null' TERM INT

/opt/debezium/debezium-adb-setup.sh &

wait ${ADB_ENTRYPOINT_PID}