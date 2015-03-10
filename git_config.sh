#!/bin/bash
# 1. 默认情况下，ubuntu下的终端中，git没有颜色,可以使用如下命令给git配色
git config --global color.status auto
git config --global color.diff auto
git config --global color.branch auto
git config --global color.interactive auto

# 2. git默认编辑器设置
git config --global core.editor vim

# 3. git alias设置
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.ci commit
#git config --global alias.df diff
git config --global alias.br branch

# 4. 设置git的user
git config --global user.name "pandaoknight@$HOSTNAME"
git config --global user.email "pandaoknight@$HOSTNAME.com"
