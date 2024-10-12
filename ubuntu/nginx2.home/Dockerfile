FROM ubuntu:24.04
RUN export DEBIAN_FRONTEND=noninteractive; \
    export DEBCONF_NONINTERACTIVE_SEEN=true; \
    echo 'tzdata tzdata/Areas select Asia' | debconf-set-selections; \
    echo 'tzdata tzdata/Zones/Asia select Tokyo' | debconf-set-selections; \
    apt-get update -qqy \
 && apt-get install -qqy --no-install-recommends \
        tzdata

RUN apt install -y curl gnupg2 ca-certificates lsb-release ubuntu-keyring &&\
    curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null &&\
    echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
http://nginx.org/packages/mainline/ubuntu `lsb_release -cs` nginx" | tee /etc/apt/sources.list.d/nginx.list

RUN apt-get update -qqy && apt install -y nginx

COPY nginx/nginx.conf /etc/nginx/
COPY nginx/wordpress.conf /etc/nginx/
COPY nginx/dhparams_4096.pem /etc/nginx/
RUN cd /usr/share/nginx && ln -s /var/log/nginx logs

# make sure the package repository is up to date

# install memcached

# expose memcached port

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["nginx"]
