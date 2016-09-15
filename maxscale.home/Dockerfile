# use the ubuntu base image provided by dotCloud
FROM centos

RUN yum -y install epel-release
RUN yum -y update
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
ADD maxscale.repo /etc/yum.repos.d/maxscale.repo
ADD mariadb.repo /etc/yum.repos.d/mariadb.repo
RUN rpm --import http://downloads.mariadb.com/software/MaxScale/MaxScale-GPG-KEY.public
RUN yum -y install MariaDB-client maxscale

