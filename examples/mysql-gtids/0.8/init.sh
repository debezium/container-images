#!/bin/sh
mysql $mysql_flags < $APP_DATA/mysql-init/inventory.sql
