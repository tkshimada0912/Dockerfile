# use the ubuntu base image provided by dotCloud
# Ubuntu 20.04 LTS with php-fpm7.4
FROM ubuntu:20.04
RUN apt-get update && apt-get upgrade -y &&\
    apt-get install -y tzdata &&\
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get install -y php-fpm php-mbstring php-mysql php-opcache php-gd php-xml php-curl php-imagick php-zip php-memcached
RUN sed -i -e 's/^listen = .*$/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf
RUN echo 'date.timezone = Asia/Tokyo' >> /etc/php/7.4/fpm/php.ini

ENTRYPOINT ["php-fpm7.4","--nodaemonize"]
EXPOSE 9000

# make sure the package repository is up to date

# install memcached

# expose memcached port
