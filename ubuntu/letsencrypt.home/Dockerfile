FROM ubuntu
RUN apt-get update && apt-get upgrade -y &&\
    apt-get install -y tzdata &&\
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN apt-get -y install software-properties-common &&\
    add-apt-repository -y ppa:certbot/certbot &&\
    apt-get update &&\
    apt-get install -y certbot
COPY mkssl.sh /mkssl.sh

# make sure the package repository is up to date

# install memcached

# expose memcached port
