# use the ubuntu base image provided by dotCloud
FROM ubuntu
RUN apt-get update && apt-get upgrade -y &&\
    apt-get install -y tzdata &&\
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get install -y php-fpm php-mbstring php-mysql php-opcache php-gd
RUN mkdir /run/php
RUN sed -i -e 's/^listen = .*$/listen = 0.0.0.0:9000/' /etc/php/7.2/fpm/pool.d/www.conf
RUN echo 'date.timezone = Asia/Tokyo' >> /etc/php/7.2/fpm/php.ini

ENTRYPOINT ["php-fpm7.2","--nodaemonize"]
EXPOSE 9000

# make sure the package repository is up to date

# install memcached

# expose memcached port
