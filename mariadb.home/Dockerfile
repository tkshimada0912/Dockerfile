# use the ubuntu base image provided by dotCloud
FROM centos

RUN yum -y install epel-release &&\
    yum -y update &&\
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime &&\
    mariadb.repo /etc/yum.repos.d/mariadb.repo &&\
    yum -y install MariaDB-server MariaDB-devel MariaDB-client

# make sure the package repository is up to date

# install memcached

# expose memcached port
