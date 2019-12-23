FROM gizmo71/httpd

ENV AQUARIUM_HEALTHCHECK /srv/public_html.srou/www/healthcheck.php

RUN test -d conf/aquarium
COPY httpd.conf conf/aquarium/srou.conf
