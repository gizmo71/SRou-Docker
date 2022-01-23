#!/bin/sh -x

if grep booby /etc/hosts; then
    MINS=0,30
    DAYS=0,2,4
else
    MINS=15,45
    DAYS=1,3,5
fi

echo $MINS '* * * * wget -T 30 --header="Host: '\${SROU_HOST_WWW}'" -O - http://web/batch/updateDrivers.php' >root
echo '37 2 * *' $DAYS 'tar -cvz -f /var/backup/srouprod.tar.gz -C /home/srouprod . >/var/backup/log.txt' >>root

pwd
ls -l
cat /var/spool/cron/crontabs/root

exec crond -l 8 -f -L /dev/stdout
