FROM alpine

RUN apk add --no-cache lftp

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]