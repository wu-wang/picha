#!/bin/bash
source /opt/venvs/celery_demo/bin/activate
cd /opt/picha
count=`ps -ef |grep beat |grep -v "grep" |wc -l`
if [ 0 == $count ];then
 nohup python manage.py celery beat &
else
  ps -ef|grep beat|grep -v grep|cut -c 9-15|xargs kill -9
  rm -rf celerybeat.pid
  python manage.py celery beat
fi
