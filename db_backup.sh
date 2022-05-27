#!/bin/bash
DATE=$(date +%Y-%m-%d)
MYSQL_DIR=/usr/bin/
BACKUP_DIR=/backUp/

if [ ! -d $BACKUP_DIR ]; then
    mkdir $BACKUP_DIR
fi

$MYSQL_DIR"mysqldump" --login-path=dbUser  --all-databases > $BACkUP_DIR"backup_"$DATE.sql