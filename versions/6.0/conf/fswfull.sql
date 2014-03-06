create database if not exists fsw;
grant all on fsw.* to 'fsw'@'${env.OPENSHIFT_FSW_IP}' identified by '${env.OPENSHIFT_MYSQL_DB_USERNAME}';
