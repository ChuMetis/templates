#!/bin/bash
CWD="`dirname $0`"
cd "${CWD}"
CWD="`pwd`"

if [ -d ".git" ]
then
  git pull
fi

#git clone https://github.com/ChuMetis/templates.git .



