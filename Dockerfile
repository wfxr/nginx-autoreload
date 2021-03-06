FROM nginx:1.15-alpine

RUN apk add --no-cache bash

ADD autoreload.sh /etc/nginx/autoreload.sh

CMD ["sh", "-c", "/etc/nginx/autoreload.sh & nginx -g 'daemon off;'"]
