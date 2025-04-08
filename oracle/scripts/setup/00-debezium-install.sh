
# Configures the LogMiner adapter
function configure_logminer() {
  echo ""
  echo "****************************************************************"
  echo "** Configuring Oracle LogMiner for Debezium"
  echo "****************************************************************"
  echo ""
  echo "Setting Oracle recovery area as '${RECOVERY_AREA_PATH}' with '${RECOVERY_AREA_PATH}'"

  echo "Creating ${RECOVERY_AREA_PATH}"
  mkdir -p ${RECOVERY_AREA_PATH}

  sqlplus /nolog <<- EOF
    CONNECT ${SYS_USER}/${SYS_PASSWORD} AS sysdba
    alter system set db_recovery_file_dest_size = ${RECOVERY_AREA_SIZE};
    alter system set db_recovery_file_dest = '${RECOVERY_AREA_PATH}' scope=spfile;
    shutdown immediate
    startup mount
    alter database archivelog;
    alter database open;
    -- Should now show "Database log mode: Archive Mode"
    archive log list
    exit;
EOF

  sqlplus /nolog <<- EOF
    CONNECT ${SYS_USER}/${SYS_PASSWORD} AS sysdba
    ALTER DATABASE ADD SUPPLEMENTAL LOG DATA;
    ALTER PROFILE DEFAULT LIMIT FAILED_LOGIN_ATTEMPTS UNLIMITED;
    ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;

    CREATE TABLESPACE LOGMINER_TBS DATAFILE '${LOGMINER_DBF}' SIZE 25M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;
EOF

  if [ "${INSTALL_PDB,,}" == "true" ]; then
    sqlplus /nolog <<- EOF
      CONNECT ${SYS_USER}/${SYS_PASSWORD}@//localhost:1521/${PDB_NAME} as sysdba
      CREATE TABLESPACE LOGMINER_TBS DATAFILE '${LOGMINER_PDB_DBF}' SIZE 25M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;
EOF
  fi

  sqlplus /nolog <<- EOF
    CONNECT ${SYS_USER}/${SYS_PASSWORD} as sysdba
    CREATE USER ${CONNECTOR_USER} IDENTIFIED BY ${CONNECTOR_USER_PASS} DEFAULT TABLESPACE LOGMINER_TBS QUOTA UNLIMITED ON LOGMINER_TBS ${CONTAINERS};

    GRANT CREATE SESSION TO ${CONNECTOR_USER} ${CONTAINERS};
    GRANT SET CONTAINER TO ${CONNECTOR_USER} ${CONTAINERS};
    GRANT SELECT ON V_\$DATABASE TO ${CONNECTOR_USER} ${CONTAINERS};
    GRANT FLASHBACK ANY TABLE TO ${CONNECTOR_USER} ${CONTAINERS};
    GRANT SELECT ANY TABLE TO ${CONNECTOR_USER} ${CONTAINERS};
    GRANT SELECT_CATALOG_ROLE TO ${CONNECTOR_USER} ${CONTAINERS};
    GRANT EXECUTE_CATALOG_ROLE TO ${CONNECTOR_USER} ${CONTAINERS};
    GRANT SELECT ANY TRANSACTION TO ${CONNECTOR_USER} ${CONTAINERS};
    GRANT SELECT ANY DICTIONARY TO ${CONNECTOR_USER} ${CONTAINERS};
    GRANT LOGMINING TO ${CONNECTOR_USER} ${CONTAINERS};
    GRANT CREATE TABLE TO ${CONNECTOR_USER} ${CONTAINERS};
    GRANT LOCK ANY TABLE TO ${CONNECTOR_USER} ${CONTAINERS};
    GRANT CREATE SEQUENCE TO ${CONNECTOR_USER} ${CONTAINERS};
    GRANT EXECUTE ON DBMS_LOGMNR TO ${CONNECTOR_USER} ${CONTAINERS};
    GRANT EXECUTE ON DBMS_LOGMNR_D TO ${CONNECTOR_USER} ${CONTAINERS};
    GRANT SELECT ON V_\$LOGMNR_LOGS TO ${CONNECTOR_USER} ${CONTAINERS};
    GRANT SELECT ON V_\$LOGMNR_CONTENTS TO ${CONNECTOR_USER} ${CONTAINERS};
    GRANT SELECT ON V_\$LOGFILE TO ${CONNECTOR_USER} ${CONTAINERS};
    GRANT SELECT ON V_\$ARCHIVED_LOG TO ${CONNECTOR_USER} ${CONTAINERS};
    GRANT SELECT ON V_\$ARCHIVE_DEST_STATUS TO ${CONNECTOR_USER} ${CONTAINERS};

    exit;
EOF

  if [ "${INSTALL_PDB,,}" == "true" ]; then
    sqlplus /nolog <<- EOF
      CONNECT ${SYS_USER}/${SYS_PASSWORD}@//localhost:1521/${PDB_NAME} as sysdba

      ALTER PROFILE DEFAULT LIMIT FAILED_LOGIN_ATTEMPTS UNLIMITED;
      ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;

      CREATE USER ${SCHEMA_USER} IDENTIFIED BY ${SCHEMA_USER_PASS};
      GRANT CONNECT TO ${SCHEMA_USER};
      GRANT CREATE SESSION TO ${SCHEMA_USER};
      GRANT CREATE TABLE TO ${SCHEMA_USER};
      GRANT CREATE SEQUENCE TO ${SCHEMA_USER};
      ALTER USER ${SCHEMA_USER} QUOTA UNLIMITED ON USERS;

      exit;
EOF
  else
    sqlplus /nolog <<- EOF
      CONNECT ${SYS_USER}/${SYS_PASSWORD}@//localhost:1521/${DB_NAME} as sysdba

      ALTER PROFILE DEFAULT LIMIT FAILED_LOGIN_ATTEMPTS UNLIMITED;
      ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;

      CREATE USER ${SCHEMA_USER} IDENTIFIED BY ${SCHEMA_USER_PASS};
      GRANT CONNECT TO ${SCHEMA_USER};
      GRANT CREATE SESSION TO ${SCHEMA_USER};
      GRANT CREATE TABLE TO ${SCHEMA_USER};
      GRANT CREATE SEQUENCE TO ${SCHEMA_USER};
      ALTER USER ${SCHEMA_USER} QUOTA UNLIMITED ON USERS;

      exit;
EOF
  fi
}

# Configures the XStream adapter
configure_xstream() {
  echo ""
  echo "****************************************************************"
  echo "** Configuring Oracle XStream for Debezium"
  echo "****************************************************************"
  echo ""
  echo "Setting Oracle recovery area as '${RECOVERY_AREA_PATH}' with '${RECOVERY_AREA_PATH}'"
  echo "Enabling GoldenGate Replication for XStream"

  echo "Creating ${RECOVERY_AREA_PATH}"
  mkdir -p ${RECOVERY_AREA_PATH}

  sqlplus /nolog <<- EOF
      CONNECT ${SYS_USER}/${SYS_PASSWORD} AS sysdba
      alter system set db_recovery_file_dest_size = ${RECOVERY_AREA_SIZE};
      alter system set db_recovery_file_dest = '${RECOVERY_AREA_PATH}' scope=spfile;
      alter system set enable_goldengate_replication=true;
      shutdown immediate
      startup mount
      alter database archivelog;
      alter database open;
      -- Should now show "Database log mode: Archive Mode"
      archive log list
      exit;
EOF

  sqlplus /nolog <<- EOF
    CONNECT ${SYS_USER}/${SYS_PASSWORD} as sysdba
    ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;
    CREATE TABLESPACE xstream_adm_tbs DATAFILE '${XSTREAM_ADM_DBF}' SIZE 25M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;
    CREATE TABLESPACE xstream_tbs DATAFILE '${XSTREAM_DBF}' SIZE 25M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;
    exit;
EOF

  if [ "${INSTALL_PDB,,}" == "true" ]; then
    sqlplus /nolog <<- EOF
      CONNECT ${SYS_USER}/${SYS_PASSWORD}@//localhost:1521/${PDB_NAME} as sysdba
      CREATE TABLESPACE xstream_adm_tbs DATAFILE '${XSTREAM_ADM_PDB_DBF}' SIZE 25M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;
      CREATE TABLESPACE xstream_tbs DATAFILE '${XSTREAM_PDB_DBF}' SIZE 25M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;
      exit;
EOF
  fi

  sqlplus /nolog <<- EOF
    CONNECT ${SYS_USER}/${SYS_PASSWORD}@//localhost:1521/${DB_NAME} as sysdba
  	CREATE USER ${ADMIN_USER} IDENTIFIED BY ${ADMIN_USER_PASS}
  	  DEFAULT TABLESPACE xstream_adm_tbs
  	  QUOTA UNLIMITED ON xstream_adm_tbs
  	  ${CONTAINERS};

  	GRANT CREATE SESSION, SET CONTAINER TO ${ADMIN_USER} ${CONTAINERS};

  	CREATE USER ${CONNECTOR_USER} IDENTIFIED BY ${CONNECTOR_USER_PASS}
  	  DEFAULT TABLESPACE xstream_tbs
  	  QUOTA UNLIMITED ON xstream_tbs
  	  ${CONTAINERS};

  	GRANT CREATE SESSION TO ${CONNECTOR_USER} ${CONTAINERS};
  	GRANT SET CONTAINER TO ${CONNECTOR_USER} ${CONTAINERS};
  	GRANT SELECT ON V_\$DATABASE TO ${CONNECTOR_USER} ${CONTAINERS};
  	GRANT FLASHBACK ANY TABLE TO ${CONNECTOR_USER} ${CONTAINERS};
  	GRANT SELECT_CATALOG_ROLE TO ${CONNECTOR_USER} ${CONTAINERS};
  	GRANT EXECUTE_CATALOG_ROLE TO ${CONNECTOR_USER} ${CONTAINERS};

  	BEGIN
  	   DBMS_XSTREAM_AUTH.GRANT_ADMIN_PRIVILEGE(
  	      grantee                 => '${ADMIN_USER}',
  	      privilege_type          => 'CAPTURE',
  	      grant_select_privileges => TRUE,
  	      container               => 'ALL'
  	   );
  	END;
  	/
  	exit;
EOF

  if [ "${INSTALL_PDB,,}" == "true" ]; then
    sqlplus /nolog <<- EOF
      CONNECT ${SYS_USER}/${SYS_PASSWORD}@//localhost:1521/${PDB_NAME} as sysdba

      ALTER PROFILE DEFAULT LIMIT FAILED_LOGIN_ATTEMPTS UNLIMITED;
      ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;

      CREATE USER ${SCHEMA_USER} IDENTIFIED BY ${SCHEMA_USER_PASS};
      GRANT CONNECT TO ${SCHEMA_USER};
      GRANT CREATE SESSION TO ${SCHEMA_USER};
      GRANT CREATE TABLE TO ${SCHEMA_USER};
      GRANT CREATE SEQUENCE TO ${SCHEMA_USER};
      ALTER USER ${SCHEMA_USER} QUOTA UNLIMITED ON users;
      exit;
EOF
  else
    sqlplus /nolog <<- EOF
      CONNECT ${SYS_USER}/${SYS_PASSWORD}@//localhost:1521/${DB_NAME} as sysdba

      ALTER PROFILE DEFAULT LIMIT FAILED_LOGIN_ATTEMPTS UNLIMITED;
      ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;

      CREATE USER ${SCHEMA_USER} IDENTIFIED BY ${SCHEMA_USER_PASS};
      GRANT CONNECT TO ${SCHEMA_USER};
      GRANT CREATE SESSION TO ${SCHEMA_USER};
      GRANT CREATE TABLE TO ${SCHEMA_USER};
      GRANT CREATE SEQUENCE TO ${SCHEMA_USER};
      ALTER USER ${SCHEMA_USER} QUOTA UNLIMITED ON users;
      exit;
EOF
  fi

  sqlplus /nolog <<- EOF
    CONNECT ${SYS_USER}/${SYS_PASSWORD}@//localhost:1521/${DB_NAME} as sysdba
    DECLARE
      tables DBMS_UTILITY.UNCL_ARRAY;
      schemas DBMS_UTILITY.UNCL_ARRAY;
    BEGIN
      tables(1) := NULL;
      schemas(1) := '${SCHEMA_USER}';
      DBMS_XSTREAM_ADM.CREATE_OUTBOUND(server_name => '${OUTBOUND_SERVER}', table_names => tables, schema_names => schemas);
      DBMS_XSTREAM_ADM.ALTER_OUTBOUND(server_name => '${OUTBOUND_SERVER}', connect_user => '${CONNECTOR_USER}');
    END;
    /
    exit;
EOF

}

function resize_redo_logs() {
  sqlplus /nolog <<- EOF
    CONNECT ${SYS_USER}/${SYS_PASSWORD} as sysdba
    DECLARE
      CURSOR c_logs IS
      SELECT * FROM V_\$LOG;
      recCount NUMBER;
      status varchar2(50);
    BEGIN
      FOR r_log IN c_logs
      LOOP
      	dbms_output.put_line('Processing Log Group ' || r_log.GROUP#);
      	IF r_log.BYTES < 419430400 THEN

      	  -- Wait for log to become inactive
      	  dbms_output.put_line(' Waiting for log to become inactive');
      	  WHILE TRUE
      	  LOOP

      	    SELECT STATUS INTO status
      	      FROM V_\$LOG
      	     WHERE GROUP# = r_log.GROUP#;

      	    IF status = 'INACTIVE' or status = 'UNUSED' THEN
      	      EXIT;
      	    ELSIF status = 'CURRENT' THEN
      	      dbms_output.put_line(' Log is current, initiating log switch');
      	      EXECUTE IMMEDIATE 'alter system switch logfile';
      	    ELSIF status = 'ACTIVE' THEN
      	      dbms_output.put_line(' Log is active, waiting...');
      	      EXECUTE IMMEDIATE 'alter system checkpoint';
      	    END IF;

      	  END LOOP;

      	  -- Log is now inactive
       	  dbms_output.put_line('Redo Log Group ' || r_log.GROUP# || ' is being modified');
          EXECUTE IMMEDIATE 'alter system checkpoint';
       	  EXECUTE IMMEDIATE 'alter database clear logfile group ' || r_log.GROUP#;
       	  EXECUTE IMMEDIATE 'alter database drop logfile group ' || r_log.GROUP#;
       	  EXECUTE IMMEDIATE 'alter database add logfile group ' || r_log.GROUP# || ' (''/opt/oracle/oradata/${DB_NAME}/redo0' || r_log.GROUP# || '.log'') size 400m reuse';

      	END IF;
      END LOOP;
    END;
    /
EOF

}

# Source installation arguments from the environment.
# These are set when the container is created.
INSTALL_ADAPTER="${DEBEZIUM_ADAPTER:-logminer}"
INSTALL_PDB="${DEBEZIUM_CDB:-true}"

# Defines the Oracle "root" user account and password.
SYS_USER='sys'
SYS_PASSWORD='top_secret'

# Sets the database names
# The PDB_NAME will only be used if installation is configured to use PDB.
DB_NAME='ORCLCDB'
PDB_NAME='ORCLPDB1'

# Configures the Oracle recovery area settings
RECOVERY_AREA_SIZE="15G"
RECOVERY_AREA_PATH="/opt/oracle/oradata/recovery_area"

# Paths to the tablespaces to create for Oracle LogMiner
LOGMINER_DBF="/opt/oracle/oradata/${DB_NAME}/logminer_tbs.dbf"
LOGMINER_PDB_DBF="/opt/oracle/oradata/${DB_NAME}/${PDB_NAME}/logminer_tbs.dbf"

# Paths to the tablespaces to create for Oracle XStream
XSTREAM_ADM_DBF="/opt/oracle/oradata/${DB_NAME}/xstream_adm_tbs.dbf"
XSTREAM_ADM_PDB_DBF="/opt/oracle/oradata/${DB_NAME}/${PDB_NAME}/xstream_adm_tbs.dbf"
XSTREAM_DBF="/opt/oracle/oradata/${DB_NAME}/xstream_tbs.dbf"
XSTREAM_PDB_DBF="/opt/oracle/oradata/${DB_NAME}/${PDB_NAME}/xstream_tbs.dbf"

# Default user credentials used by the connector
CONNECTOR_USER='dbzuser'
CONNECTOR_USER_PASS='dbz'

# Default user credentials used by the tests
SCHEMA_USER='debezium'
SCHEMA_USER_PASS='dbz'

# XStream user credentials for the XStream administrator account
ADMIN_USER='dbzadmin'
ADMIN_USER_PASS='xsa'

# XStream outbound server name
OUTBOUND_SERVER='dbzxout'

# The containers clause to be used when applying user grants
CONTAINERS=' '

# Sets specific override values when installation is for a PDB
if [ "${INSTALL_PDB,,}" == "true" ]; then
  CONNECTOR_USER='c##dbzuser'
  ADMIN_USER='c##dbzadmin'
  CONTAINERS="CONTAINER=ALL"
fi

# Fixes an issue with SQLNet connectivity
echo "Fixing sqlnet.ora configuration (Oracle 19+)"
echo "tcp.validnode_checking=no
DISABLE_OOB=on
" >> /opt/oracle/oradata/dbconfig/${DB_NAME}/sqlnet.ora

# After changing the SQLNet configuration, the Oracle TNS listener needs to be reloaded.
echo "Reloading TNS listener since configuration has changed"
lsnrctl reload

if [ "${INSTALL_ADAPTER,,}" == "logminer" ]; then
  configure_logminer;
  resize_redo_logs;
elif [ "${INSTALL_ADAPTER,,}" == "xstream" ]; then
  configure_xstream;
  resize_redo_logs;
else
  echo ""
  echo "****************************************************************"
  echo "** ERROR: Unknown adapter '${INSTALL_ADAPTER}', configuration skipped"
  echo "****************************************************************"
  echo ""
  exit 1;
fi

