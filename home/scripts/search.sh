#!/bin/bash
echo ${0}

if [ "x$1" == "x" ]; then
        echo "Usage: ${0} project_name"
        exit 0
fi

source /Users/TP1/scripts/env.sh

echo "search $1 on $ENV"
echo "Found $(ls $VHOST_WORKSPACE |grep -i $1 |wc -l) in $VHOST_WORKSPACE"
ls $VHOST_WORKSPACE |grep -i $1
echo "Found $(mysql -e "show databases;" |grep -i $1 |wc -l) in mysql"
mysql -e "show databases;" |grep -i $1

echo "Found $(cat $VHOST_CONF |grep -i $1 |wc -l) in apache conf"
cat $VHOST_CONF |grep -i $1

