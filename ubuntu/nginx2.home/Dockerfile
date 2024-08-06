FROM ubuntu:24.04
RUN apt update && apt upgrade -y &&\
    DEBIAN_FRONTEND=noninteractive apt install -y tzdata &&\
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt install -y curl gnupg2 ca-certificates lsb-release ubuntu-keyring &&\
    curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null &&\
    echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
http://nginx.org/packages/mainline/ubuntu `lsb_release -cs` nginx" | tee /etc/apt/sources.list.d/nginx.list

RUN apt install -y nginx

COPY nginx/nginx.conf /etc/nginx/
COPY nginx/wordpress.conf /etc/nginx/

# make sure the package repository is up to date

# install memcached

# expose memcached port

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["nginx"]
