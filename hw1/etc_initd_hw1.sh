#!/bin/bash
### BEGIN INIT INFO
# Provides:             hw1
# Required-start:       $all
# Required-stop:        $all
# Default-start:        2 3 4 5
# Default-stop:         0 1 6
### END INIT INFO
case $1 in
        start)
                echo start + date >> /var/log/hw1.log
                /opt/hw1.sh &
                echo $! > /var/run/hw1.pid
        ;;
        stop)
                echo stop + date >> /var/log/hw1.log
                kill $(cat /var/run/hw1.pid)
				rm /var/run/hw1.pid
        ;;
        restart)
                $0 stop
                $0 start
        ;;
        status)
                if [ -e /var/run/hw1.pid ]; then
                        echo hw1 is running, pid=$(cat /var/run/hw1.pid)
                else
                        echo hw1 is NOT running
                        exit 1
                fi
        ;;
        *)
                echo start + date >> /var/log/hw1.log
                /opt/hw1.sh &
                echo $! > /var/run/hw1.pid
        ;;
esac
exit 0