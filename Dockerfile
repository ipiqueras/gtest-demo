ARG ALPINE_TAG=3.8
FROM spritsail/alpine:latest

RUN apk --no-cache add cmake make gcc g++ libc-dev linux-headers

ADD entrypoint /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint
ENTRYPOINT [ "/usr/local/bin/entrypoint" ]
