FROM alpine:3.8

LABEL org.opencontainers.image.source https://github.com/nathaninnes/fsd-server

RUN apk add --no-cache ca-certificates libstdc++ su-exec python3 py3-pip
RUN set -eux; \
    deluser xfs; \
    addgroup -g 33 fsd; \
    adduser -u 33 -s /sbin/nologin -D -Hh /var/fsd -G fsd fsd

WORKDIR /var/fsd

ADD ./src /var/fsd

RUN chown 33:33 /var/fsd -R
RUN ln -sf /dev/stdout /var/fsd/log.txt
RUN chmod -R +x /var/fsd
EXPOSE 3010 3011 6809
VOLUME ["/var/fsd"]
USER fsd

RUN chmod +x /var/fsd/entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
CMD ["start"]