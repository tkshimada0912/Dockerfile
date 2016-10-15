FROM ubuntu

RUN apt update && apt upgrade -y
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN apt install -y git gcc-c++ make
RUN yum install -y pcre-devel openssl-devel libxslt-devel gd-devel zlib-devel
RUN yum install -y geoip-devel wget golang unzip

RUN cd /tmp &&\
git clone https://github.com/pagespeed/ngx_pagespeed.git &&\
cd /tmp/ngx_pagespeed/ &&\
wget https://dl.google.com/dl/page-speed/psol/1.10.33.2.tar.gz &&\
tar xzvf 1.10.33.2.tar.gz && rm 1.10.33.2.tar.gz

RUN cd /tmp &&\
wget http://nginx.org/download/nginx-1.9.10.tar.gz &&\
tar zxvf nginx-1.9.10.tar.gz && rm nginx-1.9.10.tar.gz

RUN cd /tmp &&\
wget https://www.openssl.org/source/openssl-1.0.2f.tar.gz &&\
tar zxvf openssl-1.0.2f.tar.gz && rm openssl-1.0.2f.tar.gz

RUN cd /tmp &&\
wget https://github.com/grahamedgecombe/nginx-ct/archive/master.zip &&\
unzip master.zip && rm master.zip

RUN cd /tmp/nginx-1.9.10 && ./configure --add-module=../ngx_pagespeed \
--add-module=../nginx-ct-master --with-openssl=../openssl-1.0.2f \
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
make &&\
make install 

ADD nginx/blog.ayurina.net.crt /etc/nginx/
ADD nginx/blog.ayurina.net.csr /etc/nginx/
ADD nginx/ca.crt /etc/nginx/
ADD nginx/dhparams_4096.pem /etc/nginx/
ADD nginx/nginx.conf /etc/nginx/
ADD nginx/privkey.pem /etc/nginx/
ADD nginx/wordpress.conf /etc/nginx/

RUN useradd nginx
RUN mkdir -p /var/cache/nginx/client_temp && chown nginx /var/cache/nginx/client_temp
RUN cd /etc/nginx && ln -s /var/log/nginx logs

# make sure the package repository is up to date

# install memcached

# expose memcached port
