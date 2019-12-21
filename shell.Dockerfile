FROM alpine:latest

ARG AQUARIUM_HOME
ARG AQUARIUM_USER
ARG AQUARIUM_GROUP

# Possibly git-email too...
RUN set -xe; apk update; apk add --no-cache zsh git git-perl mariadb-client emacs-nox rsync openssh-client

RUN set -xe; \
    addgroup -g ${AQUARIUM_GROUP} -S apache; \
    adduser -u ${AQUARIUM_USER} -D -S -G apache -h ${AQUARIUM_HOME} -s /bin/zsh srou

WORKDIR ${AQUARIUM_HOME}

CMD [ "/bin/zsh" ]
