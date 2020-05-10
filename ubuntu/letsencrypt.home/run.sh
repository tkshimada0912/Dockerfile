#!/bin/sh
#
# Run letsencrypt container and exec mkssl.sh and certbot renew command
#

docker run --rm -it -v /share/letsencrypt:/etc/letsencrypt -v /share/www/html:/var/www/html letsencrypt /bin/bash
