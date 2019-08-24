#!/bin/sh

docker run --rm -it -v /share/letsencrypt:/etc/letsencrypt -v /share/www/html:/var/www/html letsencrypt /bin/bash
