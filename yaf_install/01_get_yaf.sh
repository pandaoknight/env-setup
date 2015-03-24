#!/bin/bash
wget -c http://pecl.php.net/get/yaf -O yaf.tar
tar -xvf yaf.tar

#定义颜色的变量
RED_COLOR='\E[1;31m'  #红
GREEN_COLOR='\E[1;32m' #绿
YELLOW_COLOR='\E[1;33m' #黄
BLUE_COLOR='\E[1;34m'  #蓝
RES='\E[0m'

#需要使用echo -e
echo -e  "${GREEN_COLOR}[OK] The lastest yaf got!${RES}"
