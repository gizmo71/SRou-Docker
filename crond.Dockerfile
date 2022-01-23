FROM alpine

WORKDIR /var/spool/cron/crontabs

COPY crontab-create.sh /root/crontab-create.sh

CMD /root/crontab-create.sh
