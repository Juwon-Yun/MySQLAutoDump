# ๐จ๐ปโ๐ง MySQL Auto Dump(MAD)  v1

# ๐คท๐ป When
๋ก์ปฌ DB ํน์ ๊ฐ๋ฐ์ฉ DB ๋ฐฑ์์ ์๋ํํ๊ณ  ์ถ์ ๋ ์ฌ์ฉํฉ๋๋ค.

# ๐ How
๋ค์ฏ๊ฐ์ง ์ฌ์  ์ธํ์ด ํ์ํฉ๋๋ค.

1. docker-compose 
2. Mysql Image (5.7^), 5.6 ๋ฒ์ ๊ณผ 5.7 ๋ฒ์ ์ ๋ช๋ น์ด๊ฐ ๋ค๋ฆ๋๋ค.
3. vim in docker-container
4. cron in docker-container
5. ํ์ด๋ธ์ด ์กด์ฌํ๋ DB ์คํค๋ง
#

    git clone this repo

    clone ๋ฐ์ ๊ฒฝ๋ก ์์น์์

    $docker-compose up -d 

    $docker exec -it docker-compose_testAutoDump_1 /bin/bash

    $apt-get update

    $apt install vim -y

    $apt install cron -y
    
    $mysql_config_editor set โlogin-path={์ค์ ํ  ๊ฐ} โhost=localhost โuser={dbUser} โpassword โport={3306์ด๋ผ๋ฉด ์๋ต ๊ฐ๋ฅ}

    password : 1234

    vi db_backup.sh -> cloneํ ํ์ผ ๋ด์ฉ์ผ๋ก ๋ณต๋ถํฉ๋๋ค.

    $crontab -e

์๋ ฅํ๋ฉด vim editer์ ๊ฐ์ ์ฐฝ์ด ์ด๋ฆฝ๋๋ค.

์๋ ๋ช๋ น์ด๋ฅผ ์๋ ฅํ ๋ค

    * 10 * * 5 cd backUp && sh db_backup.sh
    
    ๋ถ | ์ | ์ผ | ์ | ์์ผ | ๋ช๋ น์ด 
    => ๋งค์ฃผ ๊ธ์์ผ 10์์ db_backup ์คํฌ๋ฆฝํธ ์คํ

    esc -> :wq -> enter ํ ์๋ ฅํ ๋ด์ฉ ์ ์ฅ

crontab์ ์ฌ์คํํฉ๋๋ค.

    /etc/init.d/cron restart

db ์ค๋ฅ๊ฐ ๋ฐ์ํ์ง ์๋๋ค๋ฉด ์ ์์ ์ผ๋ก ์๋ํ  ๊ฒ์๋๋ค.



# ๐ก Tips
1. sh db_backup.sh ๋ช๋ น์ด ์คํ ์

    you need (at least one of) the PROCESS privilege(s) for this operation

    ํด๋น ์ค๋ฅ๋ ํ์ด๋ธ์ด ์กด์ฌํด์ผ ํฉ๋๋ค. 

    ํน์ useย --no-tablespaces ๋ฅผ ์ฌ์ฉํด๋ ๋์ง๋ง ๋น๊ถ์ฅ์๋๋ค.

#
2.  ๊ธฐํ ๋ช๋ น์ด๋ค 

    ์ ์ ์ ๋ณด๋ง ์ญ์  mysql_config_editor remove โlogin-path={์ค์ ๋ ๊ฐ}

    ๋ชจ๋  ์ ๋ณด ์ญ์  mysql_config_editor remve

    ๋ฑ๋ก๋ ์ ๋ณด ์ ๋ถ ์ถ๋ ฅ mysql_config_editor print โall

    mysql ์ ์ -> mysql โlogin-path={์ค์ ๋ ๊ฐ}
#
3. ์๋์ผ๋ก ๋ฐฑ์๋๋ .sql ํ์ผ์ crontab์ ์ถ๊ฐ์ ์ธ ์ค์ผ์ค๋ง์ผ๋ก Docker์์ ๋ก์ปฌ ํ๊ฒฝ์ผ๋ก ์ฎ๊ธธ ์ ์์ต๋๋ค.