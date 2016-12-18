FROM alpine:latest
MAINTAINER Jamie Magee "jamie.magee@gmail.com"

RUN apk -U add ca-certificates fuse \
 && rm -rf /var/cache/apk/*

RUN cd /tmp \
  && wget -q http://downloads.rclone.org/rclone-current-linux-amd64.zip \
  && unzip /tmp/rclone-current-linux-amd64.zip \ 
  && mv /tmp/rclone-*-linux-amd64/rclone /usr/bin \
  && rm -r /tmp/rclone*
  && addgroup rclone \
  && adduser -h /config -s /bin/ash -G rclone -D rclone

USER rclone

VOLUME ["/config"]

ENTRYPOINT ["/usr/bin/rclone", "--config", "/config/.rclone.conf"]

CMD ["--version"]
