FROM ubuntu

RUN apt-get update && apt-get upgrade -y &&\
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime &&\
    apt-get install -y sudo hhvm

ADD php.ini /etc/hhvm/php.ini

ENTRYPOINT ["sudo","-u","www-data","hhvm","--mode","server"]

# make sure the package repository is up to date

# install memcached

# expose memcached port
