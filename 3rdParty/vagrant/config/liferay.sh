#!/bin/bash
#
### BEGIN INIT INFO
# Provides:          liferay
# Required-Start:    $network $remote_fs $syslog
# Required-Stop:     $network $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start and stop the liferay server
# Description:       Start and stop the liferay server
### END INIT INFO

source /etc/profile

LIFERAY_HOME=/opt/liferay
LIFERAY_USER=vagrant

case "$1" in
  start)
        su - $LIFERAY_USER -c $LIFERAY_HOME/tomcat-7.0.42/bin/startup.sh
        ;;
  restart|reload|force-reload)
        echo "Error: argument '$1' not supported" >&2
        exit 3
        ;;
  stop)
        su - $LIFERAY_USER -c $LIFERAY_HOME/tomcat-7.0.42/bin/shutdown.sh
        ;;
  *)
        echo "Usage: $0 start|stop" >&2
        exit 3
        ;;
esac