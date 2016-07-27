# use the ubuntu base image provided by dotCloud
FROM centos

RUN yum -y install epel-release
RUN yum -y update
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN yum -y install install --enablerepo=remi --enablerepo=remi-php70 php php-opcache php-devel php-mbstring php-mcrypt php-mysqlnd php-phpunit-PHPUnit php-fpm php-gd php-pecl-apcu

# make sure the package repository is up to date

# install memcached

# expose memcached port
