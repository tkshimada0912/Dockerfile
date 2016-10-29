# use the ubuntu base image provided by dotCloud
FROM centos
RUN yum -y install epel-release net-tools &&\
    yum -y update &&\
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
ADD mariadb.repo /etc/yum.repos.d/mariadb.repo
RUN yum -y update && yum -y install MariaDB-server MariaDB-client &&\
    rm -fr /var/cache/yum/* /var/lib/mysql
ADD server.cnf /etc/my.cnf.d/server.cnf

# make sure the package repository is up to date

# install memcached

# expose memcached port

ENTRYPOINT ["/usr/bin/mysqld_safe"]
