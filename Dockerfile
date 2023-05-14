# Dockerfile for lighttpd

FROM alpine:3.18

RUN apk add --update --no-cache \
	lighttpd \
	lighttpd-mod_auth \
  shadow \
  && rm -rf /var/cache/apk/*

COPY data/config/lighttpd.conf /etc/lighttpd/lighttpd.conf
COPY data/config/mime-types.conf /etc/lighttpd/mime-types.conf
COPY start.sh /usr/local/bin/
COPY entrypoint.sh /usr/local/bin/

EXPOSE 80
EXPOSE 443

VOLUME /var/www/htdocs
VOLUME /etc/lighttpd

ENTRYPOINT ["entrypoint.sh"]
CMD ["start.sh"]
