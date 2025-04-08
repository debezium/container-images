#!/bin/sh

# Oracle root system user credentials
SYS_USER='sys'
SYS_PASSWORD='top_secret'

if [ -z "$ORACLE_SID" ]; then
  ORACLE_SID=ORCLCDB
  export ORACLE_SID
fi

# The DEBEZIUM_ADAPTER is set by the container environment when container is created
INSTALL_ADAPTER="${DEBEZIUM_ADAPTER:-logminer}"

# For the XStream adapter, the capture process needs to be restarted.
# This will query the capture instance information and restart it when the database is started.
if [ "${INSTALL_ADAPTER,,}" == "xstream" ]; then
  sqlplus /nolog <<- EOF
    CONNECT ${SYS_USER}/${SYS_PASSWORD} AS SYSDBA
    DECLARE
      CURSOR c_captures IS
      SELECT CAPTURE_NAME FROM DBA_CAPTURE WHERE STATUS = 'DISABLED';
    BEGIN
      FOR r_captures IN c_captures
      LOOP
        dbms_capture_adm.start_capture(capture_name => r_captures.CAPTURE_NAME);
      END LOOP;
    END;
    /
    EXIT;
EOF
  echo "Started XStream capture process."
fi