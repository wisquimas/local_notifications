#!/usr/bin/env bash
chmod -R 777 /var/www/html/pipe
#chown +R 777 /var/www/html/pipe

#service apache2 start
apachectl -D "FOREGROUND" -k start