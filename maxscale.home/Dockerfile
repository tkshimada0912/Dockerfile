# use the ubuntu base image provided by dotCloud
FROM centos

RUN yum -y install epel-release net-tools
RUN yum -y update
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
ADD maxscale.repo /etc/yum.repos.d/maxscale.repo
ADD mariadb.repo /etc/yum.repos.d/mariadb.repo
RUN yum -y install MariaDB-client maxscale
ADD maxscale.cnf /etc/maxscale.cnf

