# syntax=docker/dockerfile:1

FROM filebrowser/filebrowser:latest

RUN apk update && apk add --no-cache tini

RUN addgroup --system filebrowser && \
    adduser --system --disabled-password filebrowser --ingroup filebrowser

COPY --chmod=755 entrypoint.sh /usr/bin/

ENV FB_ROOT=/srv
ENV FB_DATABASE=/home/filebrowser/filebrowser.db
ENV FB_ADDRESS=0.0.0.0
ENV FB_PORT=8080

EXPOSE 8080
USER filebrowser
WORKDIR /home/filebrowser
ENTRYPOINT ["/sbin/tini", "-g", "--", "/usr/bin/entrypoint.sh"]
