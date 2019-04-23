#!/usr/bin/env bash
################################################################################
#    Author: Wenxuan Zhang                                                     #
#     Email: wenxuangm@gmail.com                                               #
#   Created: 2019-03-19 16:41                                                  #
################################################################################
conf=(
/etc/nginx/nginx.conf
/etc/nginx/conf.d/*
)

sum=$(cksum "${conf[@]}")
while true; do
    newsum=$(cksum "${conf[@]}")
    if [ "$newsum" != "$sum" ]; then
        echo "$(date '+%Y/%m/%d %T') [$0] nginx.conf update detected." >> /etc/nginx/autoload.log
        sum=$newsum
        nginx -t && nginx -s reload
    fi
    sleep 3
done
