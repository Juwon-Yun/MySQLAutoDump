#!/bin/bash
DATE=$(date +%Y-%m-%d)
# Mysql이 설치된 경로, 명령어에 절대경로를 입력해야 플렛폼이 다르더라고 정상 작동합니다.
MYSQL_DIR=/usr/bin/
# 백업할 경로
BACKUP_DIR=/backUp/

if [ ! -d $BACKUP_DIR ]; then
    mkdir $BACKUP_DIR
fi

$MYSQL_DIR"mysqldump" --login-path=dbUser  --all-databases > $BACkUP_DIR"backup_"$DATE.sql