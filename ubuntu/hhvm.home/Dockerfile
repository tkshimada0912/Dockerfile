FROM ubuntu
RUN apt-get update && apt-get upgrade -y &&\
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN apt-get -y install software-properties-common tzdata &&\
    apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 &&\
    add-apt-repository "deb http://dl.hhvm.com/ubuntu $(lsb_release -sc) main" &&\
    apt-get update &&\
    apt-get install -y sudo hhvm

COPY php.ini /etc/hhvm/php.ini
COPY php.ini /etc/hhvm/server.ini

ENTRYPOINT ["sudo","-u","www-data","hhvm","--mode","server"]

# make sure the package repository is up to date

# install memcached

# expose memcached port
