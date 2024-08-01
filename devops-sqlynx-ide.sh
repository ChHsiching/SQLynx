#!/bin/bash

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'

SIGNAL=${SIGNAL:-TERM}
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
APP_JAR=$(cd "$SHELL_FOLDER/main_application";ls devops-sqlynx-ide-*.jar)
PID=""
CMD=""

cd "$SHELL_FOLDER"

JAVA_PATH="$SHELL_FOLDER/jdk1.8.0_351/"

if [ -d "$JAVA_PATH" ]; then
		echo "Use software self provided java environment"
    JAVA_EXEC="${JAVA_PATH}/bin/java"
else
		echo "Use OS provided java environment, need to confirm java_home and java path correctly"
    JAVA_EXEC="java"
fi

echo $($JAVA_EXEC -version)

JAVA_OPTS="
-server
-Xms256m
-Xmx1g
-XX:+UseG1GC
-XX:+UseStringDeduplication
-XX:+HeapDumpOnOutOfMemoryError
-Dfile.encoding=utf-8"

before_show_menu() {
    show_menu
}

check() {
    echo && echo -n -e "${yellow}Please choose the correct command! ${plain}"
    show_menu
}

reset_user() {

    default_data_path="$SHELL_FOLDER/data/sqlite.db"

    read -p "Please enter the sqlite file path [default is $default_data_path]: " sqlite_path

    read -p "Please enter the reset password: " pwd

    $JAVA_EXEC $JAVA_OPTS -jar "$SHELL_FOLDER"/main_application/$APP_JAR sqlite 2 "$sqlite_path" user_login password "$pwd" name sqlynx 2>&1

}

data_migration() {

    read -p "Please enter the old version sqlite file path (fg. /home/2.0.0/sqlite.db): " old_sqlite_path

    # 获取当前脚本的工作目录
    default_data_path="$SHELL_FOLDER/data/sqlite.db"
    default_sqlPath="$SHELL_FOLDER/config/init_sqlitedb.sql"


    $JAVA_EXEC $JAVA_OPTS -jar "$SHELL_FOLDER"/main_application/$APP_JAR sqlite_enterprise "$old_sqlite_path" "$default_data_path" "$default_sqlPath" 2>&1

}

show_menu() {
    echo -e "
SQLynx-devops
————————————————
  ${green}1.${plain} historical version data migration and upgrade
  ${green}2.${plain} reset admin password
————————————————
"
    echo && read -p "Please enter the command [1-2]: [default is 1]: " num

    if [ -z "$num" ]; then
         num=1
    fi

    case "${num}" in
    1)
        data_migration
        ;;
    2)
        reset_user
        ;;
    *)
        check
        ;;
    esac
}

if [[ $# > 0 ]]; then
    case $2 in
    "reset_user")
        reset_user
        ;;
    "data_migration")
        data_migration
        ;;
    esac
else
    show_menu
fi
