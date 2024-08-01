#!/bin/bash

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'

SIGNAL=${SIGNAL:-TERM}
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
APP_JAR=$(cd "$SHELL_FOLDER/main_application";ls sqlynx-ide-*.jar)
LOG_PATH=$SHELL_FOLDER/log
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
-Xmx8g
-XX:+UseG1GC
-XX:+UseStringDeduplication
-Xloggc:./log/sqlynx-ide-gc.log
-XX:+HeapDumpOnOutOfMemoryError
-XX:HeapDumpPath=./log/sqlynx-ide-heapdump
-Dfile.encoding=utf-8"


start(){
  init
  if [ -n "$PID" ]; then
    echo -e "${red}sqlynx-ide server is running and try restart server${plain}"
    kill -s $SIGNAL $PID
  fi
  if [ ! -d "$LOG_PATH"  ];then
    mkdir "$LOG_PATH"
  fi

  nohup $JAVA_EXEC $JAVA_OPTS -jar main_application/$APP_JAR >"$LOG_PATH"/sqlynx-ide-console.log 2>&1 --spring.config.location=config/sqlynx.yaml &

  echo " __  __       _                         ____   ___  _                     "
  echo "|  \\/  | __ _(_) ___ ___  _ __   __ _  / ___| / _ \| |   _   _ _ __ __  __"
  echo "| |\\/| |/ _\` | |/ __/ _ \| '_ \\ / _\` | \\___ \\| | | | |  | | | | '_  \\ \/ /"
  echo "| |  | | (_| | | (_| (_) | | | | (_| |  ___) | |_| | |__| |_| | | | |>  < "
  echo "|_|  |_|\\__,_|_|\___\___/|_| |_|\__, | |____/ \\__\\_\\_____\\__, |_| |_/_/\_\\"
  echo "                                |___/                    |___/            "
  echo "                                                                          "
  echo -e "${green}sqlynx-ide server is starting${plain}"
  echo  "JAVA_OPTS: $JAVA_OPTS"

  echo ""
  echo -e "${green}Please check log status in log/sqlynx-ide-console.log${plain}"

}

stop(){
  init
  if [ -z "$PID" ]; then
    echo -e "${green}sqlynx-ide server not running.${plain}"
  else
    kill -s $SIGNAL $PID
    PID=""
    CMD=""
      echo -e "${green}sqlynx-ide server is stopped.${plain}"
  fi
}

restart(){
  start
}

init(){
  PID=$(ps ax | grep "main_application/$APP_JAR" | grep java | grep -v grep | awk '{print $1}')
  CMD=$(ps ax | grep "main_application/$APP_JAR" | grep java | grep -v grep | awk '{print $5}')
}

case $1 in
	"start")
	  init
		start
		;;
	"stop")
	  init
		stop
		;;
	"restart")
	  init
		restart
		;;
	*)
	echo "*************************************************"
  echo "**                                             **"
  echo "**         sqlynx-ide  commands            **"
  echo "**                                             **"
  echo "*************************************************"
  echo "**       sh  sqlynx-ide.sh start           **"
  echo "**       sh  sqlynx-ide.sh stop            **"
  echo "**       sh  sqlynx-ide.sh restart         **"
  echo "*************************************************"
		;;
esac