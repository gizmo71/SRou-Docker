FROM gizmo71/httpd:2.4-alpine

ENV AQUARIUM_HEALTHCHECK /srv/public_html.srou/www/healthcheck.php

RUN test -d conf/aquarium
COPY httpd.conf conf/aquarium/srou.conf
