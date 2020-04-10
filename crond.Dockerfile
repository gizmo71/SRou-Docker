FROM alpine

WORKDIR /var/spool/cron/crontabs

RUN if grep booby /etc/hosts; then MINS=0,30; else MINS=15,45; fi; \
	echo $MINS '* * * * wget --header="Host: '\${SROU_HOST_WWW}'" -O - http://web/batch/updateDrivers.php' >root
#RUN if grep booby /etc/hosts; then DAYS=0,2,4; else DAYS=1,3,5; fi; \
#	echo '37 2 * *' $DAYS 'tar -cvz -f /var/backup/srouprod.tar.gz -C /home/srouprod . >/var/backup/log.txt' >>root

CMD crond -l 8 -f -L /dev/stdout
