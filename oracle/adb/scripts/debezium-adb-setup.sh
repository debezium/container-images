#!/bin/bash
#
# Provisions the Autonomous Database for use with the Debezium Oracle connector test suite:
#
#   1. Unlocks the GGADMIN account, the only user permitted to use LogMiner on an
#      Autonomous Database. The user name is fixed by Oracle and cannot be changed.
#   2. Creates the DEBEZIUM test schema user. The password must satisfy the CDB-wide
#      ORA_MANDATORY_PROFILE password complexity rules, which cannot be relaxed from
#      within the ADB service; pass the chosen password to the test suite with
#      -Dschema.password.
#   3. Enables supplemental logging for all columns at the pluggable database level.
#
# Each step is applied only when needed, so the script is safe to re-run on container
# restarts and on containers started from an image that was already provisioned during
# the image build. In particular, ALTER USER is skipped when the account already accepts
# the configured password, as re-setting an identical password violates the password
# reuse policy of the account profiles (ORA-28007).

DATABASE_NAME_LOWER="${DATABASE_NAME,,}"
if [ "${WORKLOAD_TYPE^^}" = "ADW" ]; then
    SERVICE_NAME="${DATABASE_NAME_LOWER}_low.adb.oraclecloud.com"
else
    SERVICE_NAME="${DATABASE_NAME_LOWER}_tp.adb.oraclecloud.com"
fi

ADMIN_CONNECT="ADMIN/\"${ADMIN_PASSWORD}\"@localhost:1521/${SERVICE_NAME}"
GGADMIN_CONNECT="ggadmin/\"${GGADMIN_PASSWORD}\"@localhost:1521/${SERVICE_NAME}"
DEBEZIUM_CONNECT="debezium/\"${DEBEZIUM_PASSWORD}\"@localhost:1521/${SERVICE_NAME}"

can_connect() {
    echo "select 1 from dual;" | sqlplus -s -L "$1" > /dev/null 2>&1
}

echo "Debezium setup: waiting for service ${SERVICE_NAME} to become available"
DATABASE_READY="no"
for _ in $(seq 1 120); do
    if can_connect "${ADMIN_CONNECT}"; then
        DATABASE_READY="yes"
        break
    fi
    sleep 5
done

if [ "${DATABASE_READY}" != "yes" ]; then
    echo "Debezium setup: database did not become available in time, provisioning skipped"
    exit 1
fi

if can_connect "${GGADMIN_CONNECT}"; then
    echo "Debezium setup: GGADMIN already provisioned"
else
    echo "Debezium setup: unlocking GGADMIN"
    sqlplus -s -L "${ADMIN_CONNECT}" <<EOF
WHENEVER SQLERROR EXIT FAILURE
ALTER USER ggadmin IDENTIFIED BY "${GGADMIN_PASSWORD}" ACCOUNT UNLOCK;
EXIT
EOF
    if [ $? -ne 0 ]; then
        echo "Debezium setup: failed to unlock GGADMIN"
        exit 1
    fi
fi

if can_connect "${DEBEZIUM_CONNECT}"; then
    echo "Debezium setup: DEBEZIUM already provisioned"
else
    echo "Debezium setup: provisioning DEBEZIUM user"
    sqlplus -s -L "${ADMIN_CONNECT}" <<EOF
WHENEVER SQLERROR EXIT FAILURE
DECLARE
    user_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO user_count FROM all_users WHERE username = 'DEBEZIUM';
    IF user_count = 0 THEN
        EXECUTE IMMEDIATE 'CREATE USER debezium IDENTIFIED BY "${DEBEZIUM_PASSWORD}"';
    ELSE
        EXECUTE IMMEDIATE 'ALTER USER debezium IDENTIFIED BY "${DEBEZIUM_PASSWORD}" ACCOUNT UNLOCK';
    END IF;
END;
/
GRANT CONNECT, RESOURCE TO debezium;
ALTER USER debezium QUOTA UNLIMITED ON DATA;
EXIT
EOF
    if [ $? -ne 0 ]; then
        echo "Debezium setup: failed to provision the DEBEZIUM user"
        exit 1
    fi
fi

echo "Debezium setup: ensuring supplemental logging is enabled"
sqlplus -s -L "${ADMIN_CONNECT}" <<EOF
WHENEVER SQLERROR EXIT FAILURE
DECLARE
    all_column VARCHAR2(3);
BEGIN
    SELECT ALL_COLUMN INTO all_column FROM DBA_SUPPLEMENTAL_LOGGING;
    IF all_column = 'NO' THEN
        EXECUTE IMMEDIATE 'ALTER PLUGGABLE DATABASE ADD SUPPLEMENTAL LOG DATA (ALL) COLUMNS';
    END IF;
END;
/
EXIT
EOF

if [ $? -ne 0 ]; then
    echo "Debezium setup: failed to enable supplemental logging"
    exit 1
fi

echo "Debezium setup: provisioning complete"