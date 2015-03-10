#!/bin/bash
#全局安装composer，将其放置在可以被公共访问的地方
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
