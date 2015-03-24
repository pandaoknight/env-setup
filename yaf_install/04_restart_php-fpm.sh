#!/bin/bash

#定义颜色的变量
RED_COLOR='\E[1;31m'  #红
GREEN_COLOR='\E[1;32m' #绿
YELLOW_COLOR='\E[1;33m' #黄
BLUE_COLOR='\E[1;34m'  #蓝
RES='\E[0m'

#需要使用echo -e
#echo -e  "${GREEN_COLOR}[OK] Test green color!${RES}"
############################

pid_path="/alidata/server/php/var/run/php-fpm.pid"

#pid_path 必须靠自己设定。你要重启哪个php-fpm（如果有多实例的话），你自己还不知道么。
if [ ! -r "$pid_path" ]; then
    echo -e  "${RED_COLOR}[Fail] $pid_path is Not Readable File! The pid file must be set! ${RES}"
    exit
fi
############################

#重启，php 5.3.3 下的php-fpm 不再支持 php-fpm 以前具有的 /usr/local/php/sbin/php-fpm (start|stop|reload)等命令，需要使用信号控制
# master进程可以理解以下信号
# INT, TERM 立刻终止
# QUIT 平滑终止
# USR1 重新打开日志文件
# USR2 平滑重载所有worker进程并重新载入配置和二进制模块
echo -e  "${YELLOW_COLOR}[Info] Before restart, pid: `cat $pid_path` ${RES}"

kill -USR2 `cat $pid_path`
echo -e  "${GREEN_COLOR}[OK] php-fpm master process whose pid in $pid_path Restarted! ${RES}"

echo -e  "${YELLOW_COLOR}[Info] After restart, pid: `cat $pid_path` ${RES}"
