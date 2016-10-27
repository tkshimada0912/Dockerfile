FROM ubuntu

ENV PAGESPEED_VERSION 1.11.33.4
ENV OPENSSL_VERSION 1.1.0b
ENV NGINX_VERSION 1.11.5

EXPOSE 80
EXPOSE 443

RUN apt update && apt upgrade -y &&\
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime &&\
    apt install -y g++ make &&\
    apt install -y libpcre3-dev unzip git wget zlib1g-dev &&\
\
cd /tmp &&\
wget https://github.com/pagespeed/ngx_pagespeed/archive/v${PAGESPEED_VERSION}-beta.tar.gz &&\
tar zxvf v${PAGESPEED_VERSION}-beta.tar.gz && ln -s ngx_pagespeed-${PAGESPEED_VERSION}-beta ngx_pagespeed && rm v${PAGESPEED_VERSION}-beta.tar.gz &&\
cd /tmp/ngx_pagespeed/ &&\
wget https://dl.google.com/dl/page-speed/psol/${PAGESPEED_VERSION}.tar.gz &&\
tar xzvf ${PAGESPEED_VERSION}.tar.gz && rm ${PAGESPEED_VERSION}.tar.gz &&\
\
cd /tmp &&\
wget https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz &&\
tar zxvf openssl-${OPENSSL_VERSION}.tar.gz && rm openssl-${OPENSSL_VERSION}.tar.gz &&\
ln -s openssl-${OPENSSL_VERSION} openssl &&\
\
cd /tmp &&\
wget https://github.com/grahamedgecombe/nginx-ct/archive/master.zip &&\
unzip master.zip && rm master.zip &&\
\
cd /tmp &&\
wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz &&\
tar zxvf nginx-${NGINX_VERSION}.tar.gz && rm nginx-${NGINX_VERSION}.tar.gz &&\
\
cd /tmp/nginx-${NGINX_VERSION} && ./configure --add-module=../ngx_pagespeed \
--add-module=../nginx-ct-master --with-openssl=../openssl \
--prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf \
--error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log \
--pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock \
--http-client-body-temp-path=/var/cache/nginx/client_temp \
--http-proxy-temp-path=/var/cache/nginx/proxy_temp \
--http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
--http-scgi-temp-path=/var/cache/nginx/scgi_temp --user=nginx --group=nginx --with-http_ssl_module \
--with-http_realip_module --with-http_addition_module --with-http_sub_module \
--with-http_dav_module --with-http_flv_module --with-http_mp4_module \
--with-http_gunzip_module --with-http_gzip_static_module --with-http_random_index_module \
--with-http_secure_link_module --with-http_stub_status_module --with-http_auth_request_module \
--with-threads --with-stream --with-stream_ssl_module --with-http_slice_module --with-mail \
--with-mail_ssl_module --with-ipv6 --with-http_v2_module \
--with-cc-opt='-O2 -g -pipe -m64 -mtune=generic' &&\
make -j2 &&\
make install &&\
cd /tmp && rm -fr ng* openssl*

COPY nginx/ssl/ayurina.net-ecc.crt /etc/nginx/
COPY nginx/ssl/ayurina-ecc.key /etc/nginx/
COPY nginx/ca.crt /etc/nginx/
COPY nginx/dhparams_4096.pem /etc/nginx/
COPY nginx/nginx.conf /etc/nginx/
COPY nginx/wordpress.conf /etc/nginx/

RUN useradd nginx
RUN mkdir -p /var/cache/nginx/client_temp && chown nginx /var/cache/nginx/client_temp
RUN mkdir -p /var/run/nginx-cache && chown nginx /var/run/nginx-cache
RUN cd /etc/nginx && ln -s /var/log/nginx logs

# make sure the package repository is up to date

# install memcached

# expose memcached port

ENTRYPOINT ["nginx"]
