# use the ubuntu base image provided by dotCloud
# Ubuntu 20.04 LTS with php-fpm8.3
FROM ubuntu:24.04
ENV PHP_VERSION 8.5

RUN export DEBIAN_FRONTEND=noninteractive; \
    export DEBCONF_NONINTERACTIVE_SEEN=true; \
    echo 'tzdata tzdata/Areas select Asia' | debconf-set-selections; \
    echo 'tzdata tzdata/Zones/Asia select Tokyo' | debconf-set-selections; \
    apt-get update -qqy \
 && apt-get install -qqy --no-install-recommends \
        tzdata \
        software-properties-common \
        ca-certificates \
        wget gnupg \
 && add-apt-repository -y ppa:ondrej/php && \
    apt-get update


RUN apt-get install -y --no-install-recommends \
      php${PHP_VERSION}-cli \
      php${PHP_VERSION}-fpm \
      php${PHP_VERSION}-mbstring \
      php${PHP_VERSION}-mysql \
      php${PHP_VERSION}-apcu \
      php${PHP_VERSION}-gd \
      php${PHP_VERSION}-xml \
      php${PHP_VERSION}-curl \
      php${PHP_VERSION}-imagick \
      php${PHP_VERSION}-zip \
      php${PHP_VERSION}-memcached \
      php${PHP_VERSION}-intl && \
    rm -rf /var/lib/apt/lists/*
RUN sed -i \
        -e 's/^listen = .*$/listen = 0.0.0.0:9000/' \
        -e 's/^pm.max_children = .*$/pm.max_children = 20/' \
        -e 's/^pm.start_servers = .*$/pm.start_servers = 5/' \
        -e 's/^pm.min_spare_servers = .*$/pm.min_spare_servers = 2/' \
        -e 's/^pm.max_spare_servers = .*$/pm.max_spare_servers = 6/' /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf
RUN printf '%s\n' \
      'post_max_size = 24M' \
      'upload_max_filesize = 20M' \
      'date.timezone = Asia/Tokyo' \
      > /etc/php/${PHP_VERSION}/fpm/conf.d/99-custom.ini


## RUN echo newrelic-php5 newrelic-php5/application-name string "php-fpm" | debconf-set-selections; \
    ## echo newrelic-php5 newrelic-php5/license-key string NEWRELICAPIKEY | debconf-set-selections; \
    ## echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' | tee /etc/apt/sources.list.d/newrelic.list; \
    ## wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add - ; \
    ## apt-get update; \
    ## DEBIAN_FRONTEND=noninteractive apt-get -y install newrelic-php5

ENTRYPOINT php-fpm${PHP_VERSION} --nodaemonize
EXPOSE 9000

# make sure the package repository is up to date

# install memcached

# expose memcached port
