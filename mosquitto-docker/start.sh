#!/bin/sh

# start mosquitto
echo '> Starting mosquitto'
/usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf &

echo '> Mosquitto started'
while inotifywait -e close_write /mosquitto/data/acl; do
  echo '> Restarting mosquitto...'
  kill -s HUP `cat /mosquitto/var/mosquitto.pid`
done
