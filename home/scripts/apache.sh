#!/bin/bash


if [ "x$1" == "x" -o "x$2" == "x" ]; then
        echo "Usage: ${0} client_abreviation project_name"
        exit 0
fi

WORKSPACE_PATH="/Users/TP1/Sites/"
CONF_PATH="$WORKSPACE_PATH/_etc/$1.conf"
VHOST_PATH="/Users/TP1/Sites/$1/$2.local.tp1.ca"
URL="$2.local.tp1.ca"

if  ! grep --quiet $URL $CONF_PATH; then
  echo "
    <VirtualHost *:80>
        DocumentRoot \"$VHOST_PATH\"
        ServerName $URL
        ErrorLog \"/var/log/apache2/$2-stage-error_log\"
        CustomLog \"/var/log/apache2/$2-stage-access_log\" common
    </VirtualHost>" >> $CONF_PATH
else
  echo $URL already in $CONF_PATH
fi

if ! grep --quiet $URL /etc/hosts ; then
  sudo echo "127.0.0.1 $URL" >> /etc/hosts
else
  echo $URL already in /etc/hosts
fi

if [ ! -d $VHOST_PATH ];then 
  mkdir $VHOST_PATH
  echo "Hello $VHOST_PATH <?php phpinfo();" >> $VHOST_PATH/index.php
fi


echo http://$URL
