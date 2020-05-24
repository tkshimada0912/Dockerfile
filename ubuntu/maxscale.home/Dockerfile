# use the ubuntu base image provided by dotCloud
FROM ubuntu:18.04

RUN export DEBIAN_FRONTEND=noninteractive; \
    export DEBCONF_NONINTERACTIVE_SEEN=true; \
    echo 'tzdata tzdata/Areas select Asia' | debconf-set-selections; \
    echo 'tzdata tzdata/Zones/Asia select Tokyo' | debconf-set-selections; \
    apt-get update -qqy \
 && apt-get install -qqy --no-install-recommends \
        tzdata \
 && apt-get clean

RUN apt-get install -y curl;\
    curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | bash ;\
    apt-get update -qqy && apt-get install -y maxscale mariadb-client
ADD maxscale.cnf /etc/maxscale.cnf

ENTRYPOINT ["maxscale","-d","--user","maxscale"]
