FROM alpine:latest

ARG AQUARIUM_HOME
ARG AQUARIUM_USER
ARG AQUARIUM_GROUP

COPY --from=gizmo71/mariadb:10.2 --chown=${AQUARIUM_USER}:${AQUARIUM_GROUP} /root/replicate.sh /home/
RUN (echo; echo "# /home/replicate.sh booby tern \${MYSQL_PORT}") >>/home/replicate.sh && chmod 0700 /home/replicate.sh

# Possibly git-email too...
RUN set -xe; apk update; apk add --no-cache zsh git git-perl mariadb-client emacs-nox rsync openssh-client

RUN set -xe; \
    addgroup -g ${AQUARIUM_GROUP} -S apache; \
    adduser -u ${AQUARIUM_USER} -D -S -G apache -h ${AQUARIUM_HOME} -s /bin/zsh srou

WORKDIR ${AQUARIUM_HOME}

CMD [ "/bin/zsh" ]
