FROM ubuntu:20.04
RUN apt-get update && apt-get upgrade -y &&\
    apt-get install -y tzdata &&\
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN apt-get -y install software-properties-common &&\
    apt-get install -y certbot
COPY mkssl.sh /mkssl.sh

