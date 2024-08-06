# use the ubuntu base image provided by dotCloud
FROM ubuntu:24.04

RUN export DEBIAN_FRONTEND=noninteractive; \
    export DEBCONF_NONINTERACTIVE_SEEN=true; \
    echo 'tzdata tzdata/Areas select Asia' | debconf-set-selections; \
    echo 'tzdata tzdata/Zones/Asia select Tokyo' | debconf-set-selections; \
    apt-get update -qqy \
 && apt-get install -qqy --no-install-recommends \
        tzdata

RUN apt-get install -y curl && \
    curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | bash -s -- --skip-maxscale ;\
    apt-get update -qqy && apt-get install -y mariadb-server mariadb-client
ADD server.cnf /etc/mysql/mariadb.conf.d/server.cnf

ENTRYPOINT ["/usr/bin/mariadbd-safe"]
