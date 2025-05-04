# syntax=docker/dockerfile:1

FROM filebrowser/filebrowser:latest

RUN apk update && apk add --no-cache tini

RUN adduser --system --uid 33 --disabled-password --ingroup www-data www-data && \
    mkdir -p /srv && \
    chown -R www-data:www-data /srv

COPY --chmod=755 entrypoint.sh /usr/bin/

ENV FB_ROOT=/srv
ENV FB_DATABASE=/home/www-data/filebrowser.db
ENV FB_ADDRESS=0.0.0.0
ENV FB_PORT=8080

EXPOSE 8080
VOLUME ["/srv"]
USER www-data
WORKDIR /home/www-data
ENTRYPOINT ["/sbin/tini", "-g", "--", "/usr/bin/entrypoint.sh"]
