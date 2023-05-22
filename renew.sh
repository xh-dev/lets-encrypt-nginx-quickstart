#!/bin/bash

p=$(readlink -f $(dirname $0))
docker run \
        -p 53388:80 \
        -v "${p}/letsencrypt:/etc/letsencrypt" \
        certbot/certbot renew
${p}/reload-nginx.sh
