# use the ubuntu base image provided by dotCloud
# Ubuntu 20.04 LTS with php-fpm8.3
FROM ubuntu:24.04
ENV PHP_VERSION 8.3

RUN export DEBIAN_FRONTEND=noninteractive; \
    export DEBCONF_NONINTERACTIVE_SEEN=true; \
    echo 'tzdata tzdata/Areas select Asia' | debconf-set-selections; \
    echo 'tzdata tzdata/Zones/Asia select Tokyo' | debconf-set-selections; \
    apt-get update -qqy \
 && apt-get install -qqy --no-install-recommends \
        tzdata

RUN apt-get install -y php-fpm php-mbstring php-mysql php-opcache php-gd php-xml php-curl php-imagick php-zip php-memcached wget gnupg
RUN sed -i -e 's/^listen = .*$/listen = 0.0.0.0:9000/' /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf;\
    sed -i -e 's/^pm.max_children = .*$/pm.max_children = 20/' /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf;\
    sed -i -e 's/^pm.start_servers = .*$/pm.start_servers = 5/' /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf;\
    sed -i -e 's/^pm.min_spare_servers = .*$/pm.min_spare_servers = 2/' /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf;\
    sed -i -e 's/^pm.max_spare_servers = .*$/pm.max_spare_servers = 6/' /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf;\
    sed -i -e 's/^post_max_size = .*$/post_max_size = 20M/' /etc/php/${PHP_VERSION}/fpm/php.ini;\
    sed -i -e 's/^upload_max_filesize = .*$/upload_max_filesize = 20M/' /etc/php/${PHP_VERSION}/fpm/php.ini;\
    echo 'date.timezone = Asia/Tokyo' >> /etc/php/${PHP_VERSION}/fpm/php.ini

## RUN echo newrelic-php5 newrelic-php5/application-name string "php-fpm" | debconf-set-selections; \
    ## echo newrelic-php5 newrelic-php5/license-key string NEWRELICAPIKEY | debconf-set-selections; \
    ## echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' | tee /etc/apt/sources.list.d/newrelic.list; \
    ## wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add - ; \
    ## apt-get update; \
    ## DEBIAN_FRONTEND=noninteractive apt-get -y install newrelic-php5

ENTRYPOINT ["php-fpm"${PHP_VERSION} , "--nodaemonize"]
EXPOSE 9000

# make sure the package repository is up to date

# install memcached

# expose memcached port
