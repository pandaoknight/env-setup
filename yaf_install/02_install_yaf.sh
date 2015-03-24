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

yaf_path=`find . -name "yaf*" -type d`
#echo $yaf_path;exit

#先检查yaf的包是否已经获得，前提是当前目录有且只有一个 yaf-* 的安装文件夹。
if [ ! -d "$yaf_path" ]; then
    echo -e  "${RED_COLOR}[Fail] Source dir: yaf-* not exists! Please ./get_yaf.sh first! ${RES}"
    exit
fi
############################


#PHP_BIN="/alidata/server/php/bin"

# 环境检查
if [ -n "$PHP_BIN" ]; then
    echo -e  "${GREEN_COLOR}[OK] PHP_BIN: $PHP_BIN ${RES}"
else
    echo -e  "${RED_COLOR}[Fail] PHP_BIN must be set! ${RES}"
    exit
fi


if [ -x "$PHP_BIN/phpize" ]; then
    echo -e  "${GREEN_COLOR}[OK] $PHP_BIN/phpize checked! ${RES}"
else
    echo -e  "${RED_COLOR}[Fail] $PHP_BIN/phpize must be eXecutale! ${RES}"
    exit
fi
if [ -x "$PHP_BIN/php-config" ]; then
    echo -e  "${GREEN_COLOR}[OK] $PHP_BIN/php-config checked! ${RES}"
else
    echo -e  "${RED_COLOR}[Fail] $PHP_BIN/php-config must be eXecutale! ${RES}"
    exit
fi

#开始安装
cd $yaf_path

$PHP_BIN/phpize
./configure --with-php-config=$PHP_BIN/php-config
make
make install

#然后在php.ini中载入yaf.so, 重启PHP. by laruence (The writter of Yaf)
echo -e  "${YELLOW_COLOR}[Important] If installation succeed, Please reload your PHP, Not Nginx!  ${RES}"
echo -e  "${YELLOW_COLOR}[Important] 1. Run 03_bak_and_add_yaf_to_php_ini.sh  ${RES}"
echo -e  "${YELLOW_COLOR}[Important] 2. Run 04_restart_php-fpm.sh  ${RES}"


