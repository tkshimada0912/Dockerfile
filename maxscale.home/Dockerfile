# use the ubuntu base image provided by dotCloud
FROM centos
RUN yum -y install epel-release net-tools &&\
    yum -y update &&\
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
ADD maxscale.repo /etc/yum.repos.d/maxscale.repo
ADD mariadb.repo /etc/yum.repos.d/mariadb.repo
RUN yum -y update && yum -y install MariaDB-client maxscale
ADD maxscale.cnf /etc/maxscale.cnf

ENTRYPOINT ["maxscale","-d"]
