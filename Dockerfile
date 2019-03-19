FROM nginx:1.15-alpine

RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories && apk update && apk add inotify-tools

ADD autoreload.sh /etc/nginx/autoreload.sh

CMD ["sh", "-c", "/etc/nginx/autoreload.sh & nginx -g 'daemon off;'"]
