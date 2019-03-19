#!/usr/bin/env sh
################################################################################
#    Author: Wenxuan Zhang                                                     #
#     Email: wenxuangm@gmail.com                                               #
#   Created: 2019-03-19 16:41                                                  #
################################################################################

conf=/etc/nginx/nginx.conf
oldcksum=$(cksum "$conf")

inotifywait -e modify,move,create,delete -m --timefmt '+%Y/%m/%d %T' --format '%T' "$conf" |
    while read -r date time; do
        newcksum=$(cksum "$conf")
        if [ "$newcksum" != "$oldcksum" ]; then
            echo "${time} ${date} [$0] nginx.conf update detected."
            oldcksum=$newcksum
            nginx -t && nginx -s reload
        fi
done
