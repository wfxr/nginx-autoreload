#!/usr/bin/env sh
################################################################################
#    Author: Wenxuan Zhang                                                     #
#     Email: wenxuangm@gmail.com                                               #
#   Created: 2019-03-19 16:41                                                  #
################################################################################

conf=/etc/nginx/nginx.conf

sum=$(cksum "$conf")
while true; do
    newsum=$(cksum "$conf")
    if [ "$newsum" != "$sum" ]; then
        echo "$(date '+%Y/%m/%d %T') [$0] nginx.conf update detected."
        sum=$newsum
        nginx -t && nginx -s reload
    fi
    sleep 3
done
