> MySQL Auto Dump(MAD) v1

SQL 파일로 자동 덤프 설정하기 

초기 버전이므로 사전에 세팅할 것들이 많습니다.

1. docker-compose 
2. Mysql Image (5.7^), 5.6 버전과 5.7 버전은 명령어가 다릅니다.
3. vim in docker-container
4. cron in docker-container
5. 테이블이 존재하는 DB 스키마

> git clone this repo

clone 받은 폴더에서 

    $docker-compose up -d 

    $docker exec -it docker-compose_testAutoDump_1 /bin/bash

    $apt-get update

    $apt install vim -y

    $apt install cron -y
    
    $mysql_config_editor set —login-path={설정할 값} —host=localhost —user={dbUser} —password —port={3306이라면 생략 가능}

    password : 1234

    vi db_backup.sh -> clone한 파일 내용으로 복붙합니다.

    $crontab -e

입력하면 vim editer와 같은 창이 열립니다.

아래 명령어를 입력한 뒤 esc -> :wq -> enter

    * 10 * * 5 sh db_backup.sh
    
    분 | 시 | 일 | 월 | 요일 | 명령어 
    => 매주 금요일 10시에 db_backup 스크립트 실행

입력 한 뒤에 :wq 명령어로 저장

crontab을 재실행합니다.

    /etc/init.d/cron restart

db 오류가 발생하지 않는다면 정상적으로 작동할 것입니다.

sh db_backup.sh 명령어 실행 시

    you need (at least one of) the PROCESS privilege(s) for this operation

해당 오류는 테이블이 존재해야 합니다. 

혹은 use --no-tablespaces 를 사용해도 되지만 추천하지 않음


    기타 명령어들 

    접속 정보만 삭제 mysql_config_editor remove —login-path={설정된 값}

    모든 정보 삭제 mysql_config_editor remve

    등록된 스케쥴 전부 출력 mysql_config_editor print —all

    mysql 접속 -> mysql —login-path={설정된 값}