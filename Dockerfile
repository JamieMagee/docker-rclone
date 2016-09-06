FROM alpine

RUN apk -U add ca-certificates \
 && rm -rf /var/cache/apk/*

RUN cd /tmp \
  && wget -q http://downloads.rclone.org/rclone-current-linux-amd64.zip \
  && unzip /tmp/rclone-current-linux-amd64.zip \ 
  && mv /tmp/rclone-*-linux-amd64/rclone /usr/bin \
  && rm -r /tmp/rclone*

CMD ["rclone", "--version"]
