FROM ubuntu:20.04

# Update the package repository and install applications

RUN export DEBIAN_FRONTEND=noninteractive; \
    export DEBCONF_NONINTERACTIVE_SEEN=true; \
    echo 'tzdata tzdata/Areas select Asia' | debconf-set-selections; \
    echo 'tzdata tzdata/Zones/Asia select Tokyo' | debconf-set-selections; \
    apt-get update -qqy \
 && apt-get install -qqy --no-install-recommends \
        tzdata \
 && apt-get clean
 
RUN useradd memcached
RUN apt-get install -y memcached

ENV MEMCACHED_MEMORY 1024
ENV MEMCACHED_MAX_CONNECTIONS 65535
ENV MEMCACHED_MAX_ITEM_SIZE 8M

COPY start.sh /start.sh
RUN chmod 755 /start.sh

# Expose port 11211
EXPOSE 11211

CMD ["/start.sh"]

USER memcached
