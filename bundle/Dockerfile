FROM alpine:3.3

MAINTAINER  MaCroTux

RUN mkdir /data

RUN apk --update add openssl wget zip                                          \
    && rm -rf /var/cache/apk/*

COPY ./copy/download.sh /data/download.sh

RUN chmod +x /data/download.sh

WORKDIR /data

ENTRYPOINT ["/bin/sh", "-c"]
