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


php_ini_base="/alidata/server/php/etc"
php_ini_path="$php_ini_base/php.ini"

#php_ini_base 也是必须自己设定。
if [ ! -w "$php_ini_path" ]; then
    echo -e  "${RED_COLOR}[Fail] $php_ini_path is Not Writable File! The php.ini file be set! ${RES}"
    exit
fi
############################

cur_date=`date +%Y%m%d%H%M%S`
# 备份：备份的原理就是cp一个带有 .bak.{日期} 的后缀

bak_path="$php_ini_path.bak.$cur_date"
cp $php_ini_path $bak_path
echo -e  "${GREEN_COLOR}[Succ] Backup php.ini to $bak_path !${RES}"


############################
# 在php.ini最末尾添加 yaf.so
echo "extension=yaf.so" >> $php_ini_path
